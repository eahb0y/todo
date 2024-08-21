import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/core/local_source/local_source.dart';
import 'package:todo/features/add_event/presentation/bloc/add_event_bloc.dart';
import 'package:todo/features/event_page/presentation/bloc/event_bloc.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;
late Database database;
Future<void> init() async {
  await initDb();
  sl.registerSingleton<LocalSource>(LocalSource(database));
  _homeFeatures();
  _addEventFeatures();
  _eventFeatures();
}

void _homeFeatures() {
  sl.registerFactory(() => HomeBloc());
}

void _addEventFeatures() {
  sl.registerFactory(() => AddEventBloc());
}

void _eventFeatures() {
  sl.registerFactory(() => EventBloc());
}

Future<void> initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'database.db');
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_name TEXT,event_description TEXT,event_location TEXT,event_color INTEGER,event_time TEXT,event_date TEXT)');
  });
}
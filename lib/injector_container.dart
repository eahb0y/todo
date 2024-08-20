import 'package:get_it/get_it.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _homeFeatures();
}

void _homeFeatures() {
  sl.registerFactory(() => HomeBloc());
}

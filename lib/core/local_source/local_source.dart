import 'package:sqflite/sqflite.dart';
import 'package:todo/core/event/model/event_model.dart';

class LocalSource {
  final Database database;

  LocalSource(this.database);

  ///insert data
  Future<int> insertEvent(Event event) async {
    print("dataaaza :: ${event.eventDate}");
    return await database.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///get all
  Future<List<Event>> getAllEvents() async {
    final List<Map<String, dynamic>> maps = await database.query('events');
    return List<Event>.from(maps.map((map) => Event.fromMap(map)));
  }

  ///find by id
  Future<Event?> getEventById(int id) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'events',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Event.fromMap(maps.first);
    } else {
      return null;
    }
  }

  ///fing by date
  Future<List<Event>> getEventsByDate(DateTime date) async {
    final String formattedDate = date.toIso8601String().split('T').first;

    final List<Map<String, dynamic>> maps = await database.query(
      'events',
      where: 'event_date = ?',
      whereArgs: [formattedDate],
    );
    return List<Event>.from(maps.map((map) => Event.fromMap(map)));
  }

  ///delete by id
  Future<int> deleteEventById(int id) async {
    return await database.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  ///update information
  Future<int> updateEventById(int id, Event updatedEvent) async {
    return await database.update(
      'events',
      updatedEvent.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

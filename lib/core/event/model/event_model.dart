class Event {
  int? id;
  String eventName;
  String eventDescription;
  String eventLocation;
  int eventColor;
  String eventTime;
  String eventDate;

  Event({
    this.id,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventColor,
    required this.eventTime,
    required this.eventDate,
  });

  // Convert a Event object into a Map object for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'event_name': eventName,
      'event_description': eventDescription,
      'event_location': eventLocation,
      'event_color': eventColor,
      'event_time': eventTime,
      'event_date': eventDate,
    };
  }

  // Extract an Event object from a Map object
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      eventName: map['event_name'],
      eventDescription: map['event_description'],
      eventLocation: map['event_location'],
      eventColor: map['event_color'],
      eventTime: map['event_time'],
      eventDate: map['event_date'],
    );
  }
}

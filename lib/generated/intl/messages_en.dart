// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "add_event": MessageLookupByLibrary.simpleMessage("+ Add Event"),
        "delete_event": MessageLookupByLibrary.simpleMessage("Delete Event"),
        "desc": MessageLookupByLibrary.simpleMessage("Description"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "event_color": MessageLookupByLibrary.simpleMessage("Priority color"),
        "event_desc": MessageLookupByLibrary.simpleMessage("Event description"),
        "event_location":
            MessageLookupByLibrary.simpleMessage("Event location"),
        "event_name": MessageLookupByLibrary.simpleMessage("Event name"),
        "event_time": MessageLookupByLibrary.simpleMessage("Event time"),
        "reminder": MessageLookupByLibrary.simpleMessage("Reminder"),
        "schedule": MessageLookupByLibrary.simpleMessage("Schedule")
      };
}

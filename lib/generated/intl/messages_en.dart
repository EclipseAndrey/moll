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
        "active": MessageLookupByLibrary.simpleMessage("Активно"),
        "add_device":
            MessageLookupByLibrary.simpleMessage("Добавить устройство"),
        "check": MessageLookupByLibrary.simpleMessage("Проверяем"),
        "connected": MessageLookupByLibrary.simpleMessage("Подключено"),
        "devices_not_found":
            MessageLookupByLibrary.simpleMessage("Нет доступных устройств"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Не подключено"),
        "edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "empty": MessageLookupByLibrary.simpleMessage("Пусто"),
        "error": MessageLookupByLibrary.simpleMessage("Что-то пошло не так :("),
        "find": MessageLookupByLibrary.simpleMessage("Поиск устройсв"),
        "find_desk": MessageLookupByLibrary.simpleMessage(
            "Найденые устройства появятся здесь"),
        "incompatible": MessageLookupByLibrary.simpleMessage(
            "Это устройство несовместимо с текущей версией приложения. Отправьте нам результат подключений, чтобы мы могли понять, почему вы увидели это устройство в списке, и улучшили систему отбора"),
        "info": MessageLookupByLibrary.simpleMessage("Инструкция"),
        "moll": MessageLookupByLibrary.simpleMessage("Moll"),
        "name": MessageLookupByLibrary.simpleMessage("Название"),
        "pause": MessageLookupByLibrary.simpleMessage("Приостановлено"),
        "result_devices":
            MessageLookupByLibrary.simpleMessage("Найденые устройсва"),
        "results": MessageLookupByLibrary.simpleMessage("Результат"),
        "search_devices":
            MessageLookupByLibrary.simpleMessage("Ищем устройства..."),
        "what_is_sending":
            MessageLookupByLibrary.simpleMessage("Что мы отправляем")
      };
}

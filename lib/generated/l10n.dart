// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Moll`
  String get moll {
    return Intl.message(
      'Moll',
      name: 'moll',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступных устройств`
  String get devices_not_found {
    return Intl.message(
      'Нет доступных устройств',
      name: 'devices_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Ищем устройства...`
  String get search_devices {
    return Intl.message(
      'Ищем устройства...',
      name: 'search_devices',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так :(`
  String get error {
    return Intl.message(
      'Что-то пошло не так :(',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Инструкция`
  String get info {
    return Intl.message(
      'Инструкция',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Добавить устройство`
  String get add_device {
    return Intl.message(
      'Добавить устройство',
      name: 'add_device',
      desc: '',
      args: [],
    );
  }

  /// `Поиск устройсв`
  String get find {
    return Intl.message(
      'Поиск устройсв',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `Активно`
  String get active {
    return Intl.message(
      'Активно',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Приостановлено`
  String get pause {
    return Intl.message(
      'Приостановлено',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Найденые устройсва`
  String get result_devices {
    return Intl.message(
      'Найденые устройсва',
      name: 'result_devices',
      desc: '',
      args: [],
    );
  }

  /// `Результат`
  String get results {
    return Intl.message(
      'Результат',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Подключено`
  String get connected {
    return Intl.message(
      'Подключено',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Не подключено`
  String get disconnected {
    return Intl.message(
      'Не подключено',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Найденые устройства появятся здесь`
  String get find_desk {
    return Intl.message(
      'Найденые устройства появятся здесь',
      name: 'find_desk',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Пусто`
  String get empty {
    return Intl.message(
      'Пусто',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Проверяем`
  String get check {
    return Intl.message(
      'Проверяем',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Что мы отправляем`
  String get what_is_sending {
    return Intl.message(
      'Что мы отправляем',
      name: 'what_is_sending',
      desc: '',
      args: [],
    );
  }

  /// `Это устройство несовместимо с текущей версией приложения. Отправьте нам результат подключений, чтобы мы могли понять, почему вы увидели это устройство в списке, и улучшили систему отбора`
  String get incompatible {
    return Intl.message(
      'Это устройство несовместимо с текущей версией приложения. Отправьте нам результат подключений, чтобы мы могли понять, почему вы увидели это устройство в списке, и улучшили систему отбора',
      name: 'incompatible',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

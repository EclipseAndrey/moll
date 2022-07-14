// import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'dart:io' as io;

class SmallLogger {
  SmallLogger() {
    if (!kIsWeb) {
      io.stdout.supportsAnsiEscapes;
    }
  }

  final _redPen = PrettyPrinter.levelColors[Level.error]!;
  final _purple = PrettyPrinter.levelColors[Level.wtf]!;
  final _bluePen = PrettyPrinter.levelColors[Level.info]!;
  final _yellowPen = PrettyPrinter.levelColors[Level.warning]!;
  final _grayPen = PrettyPrinter.levelColors[Level.debug]!;

  void error(dynamic message) {
    dPrint(_redPen('[ERROR] | $_fTime | $message'));
  }

  void wtf(dynamic message) {
    dPrint(_purple('[WTF] | $_fTime | $message'));
  }

  void info(dynamic message) {
    dPrint(_bluePen('[INFO] | $_fTime | $message'));
  }

  void debug(dynamic message) {
    dPrint(_grayPen('[DEBUG] | $_fTime | $message'));
  }

  void warinng(dynamic message) {
    dPrint(_yellowPen('[WARNING] | $_fTime | $message'));
  }

  void dPrint(dynamic msg) {
    if (kDebugMode) {
      print('$msg');
    }
  }

  DateTime get _time => DateTime.now();

  String get _fTime {
    final t = _time;

    return '${t.hour}:${t.minute}:${t.second}';
  }
}

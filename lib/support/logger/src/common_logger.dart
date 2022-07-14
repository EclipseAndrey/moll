import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'small_logger/small_logger.dart';
import 'base_logger.dart';

/// Удобный инстанс логгера
/// для логов из единого места
abstract class L {
  static final _logger = baseLoger;
  static final _smallLogger = SmallLogger();

  /// Method for common info print
  static void print(dynamic message) {
    if (kDebugMode) {
      debugPrint(message, wrapWidth: 200);
    }
  }

  /// Error logs
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _mapErrorSize(
      error,
      stackTrace,
      onCommon: () => _logger.e(message, error, stackTrace),
      onSmall: () => _smallLogger.error(message),
    );
    //TODO: Add observer for making crash reports
    // _sendCrashReport(error, stackTrace, message);
  }

  // static void _sendCrashReport(error, StackTrace stackTrace, message) {
  //   if (error != null) {
  //     CrashReportService.instance.recordError(
  //       error,
  //       stackTrace,
  //       reason: message,
  //     );
  //   }
  // }

  /// Debug logs
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _mapErrorSize(
      error,
      stackTrace,
      onCommon: () => _logger.d(message, error, stackTrace),
      onSmall: () => _smallLogger.debug(message),
    );
  }

  /// Info logs
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _mapErrorSize(
      error,
      stackTrace,
      onCommon: () => _logger.i(message, error, stackTrace),
      onSmall: () => _smallLogger.info(message),
    );
  }

  /// Verbose logs
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  /// Warning logs
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _mapErrorSize(
      error,
      stackTrace,
      onCommon: () => _logger.w(message, error, stackTrace),
      onSmall: () => _smallLogger.warinng(message),
    );
  }

  /// What a terrible failure logs
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _mapErrorSize(
      error,
      stackTrace,
      onCommon: () => _logger.wtf(message, error, stackTrace),
      onSmall: () => _smallLogger.wtf(message),
    );
  }

  /// Common logs
  static void log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    _logger.log(level, message, error, stackTrace);
  }

  static void _mapErrorSize(
    dynamic error,
    StackTrace? stackTrace, {
    required Function() onCommon,
    required Function() onSmall,
  }) {
    if (error == null && stackTrace == null) {
      onSmall();
    } else {
      onCommon();
    }
  }
}

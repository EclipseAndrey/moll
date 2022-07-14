import 'package:logger/logger.dart';

class BasePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent logEvent) {
    return [
      logEvent.message,
      logEvent.error,
      logEvent.stackTrace?.toString() ?? '',
    ]..removeWhere((e) => e.isEmpty);
  }
}

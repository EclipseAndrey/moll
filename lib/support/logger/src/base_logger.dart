import 'package:logger/logger.dart';
import 'package:moll/support/logger/src/filters/base_filters.dart';
import 'package:moll/support/logger/src/output/console_output.dart';


final baseLoger = Logger(
  output: BaseOutput(),
  filter: BaseFilter(),
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    printTime: true,
    lineLength: 90,
    errorMethodCount: 2,
    stackTraceBeginIndex: 0,
  ),
);

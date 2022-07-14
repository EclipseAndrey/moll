import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BaseOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      debugPrint(line);
    }
  }
}

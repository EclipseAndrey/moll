import 'package:moll/models/messages/command.dart';

class CommandInfo extends Command{
  CommandInfo():super(type: "info");

  @override
  String toString() {
    return '{"type":"info"}';
  }
}
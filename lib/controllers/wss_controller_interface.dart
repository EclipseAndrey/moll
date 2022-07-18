import 'package:moll/models/host_item.dart';
import 'package:moll/models/messages/command.dart';
import 'package:rxdart/rxdart.dart';

abstract class WSSControllerInterface{
  final BehaviorSubject<HostItem> behaviorSubject = BehaviorSubject<HostItem>();
  List<HostItem> hosts = [];
  Future<bool> addHost (String host);
  Stream<HostItem> get stream => behaviorSubject.stream;
  Future<bool> sendCommand(HostItem host, Command command);
  HostItem? getHostFromIP(String ip);

  dispose(){
    behaviorSubject.close();
  }
}
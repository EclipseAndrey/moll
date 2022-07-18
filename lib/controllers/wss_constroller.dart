import 'dart:convert';
import 'dart:io';

import 'package:moll/controllers/wss_controller_interface.dart';
import 'package:moll/models/host_item.dart';
import 'package:moll/models/messages/command.dart';
import 'package:moll/models/messages/command_info.dart';
import 'package:moll/models/messages/esp_info.dart';
import 'package:moll/repositories/wss_repository/wss_repository_interface.dart';
import 'package:moll/services/wss_service/wss_service_interface.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';

class WSSController extends WSSControllerInterface{
  final WSSServiceInterface wssService;
  WSSController({required this.wssService,});

  @override
  Future<bool> addHost(String host)async {
    Socket socket = await wssService.connect(host, port: 9000);
    socket.write(CommandInfo().toString());
    socket.listen((event) {

      String mess = String.fromCharCodes(event).trim();
      try{
        ESPInfo espInfo = ESPInfo.fromJson(json.decode(mess));
        HostItem hostItem = HostItem(ip: host, name: espInfo.name, number: espInfo.number, socket: socket);
        updateDevice(hostItem);

      }catch(e, st){
        Crashlytics.printLog(e.toString(),stackTrace: st);
      }
    });
    return true;
  }

  @override
  Future<bool> sendCommand(HostItem host, Command command,) async{
    if(host.socket != null) {
      try {
        host.socket?.write(command.toString());
        return true;
      }catch(e){
        return false;
      }
    }else{
      return false;
    }
  }

  updateDevice(HostItem hostItem){
    bool find = false;

    for(HostItem h in hosts){
      if(h.number == hostItem.number){
        find = true;
      }
    }

    if(find){
      int index = hosts.indexWhere((element) => element.number == hostItem.number);
      hosts[index] = hostItem;
    }else{
      hosts.add(hostItem);
    }

    behaviorSubject.add(hostItem);

  }

  @override
  HostItem? getHostFromIP(String ip) {
    try {
      int? index = hosts.indexWhere((element) =>
      element.ip == ip);
      return hosts[index];
    }
    catch(e){
      return null;
    }
  }

}
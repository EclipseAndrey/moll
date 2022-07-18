import 'dart:convert';
import 'dart:io';

import 'package:moll/models/host_item.dart';
import 'package:moll/models/messages/esp_info.dart';
import 'package:moll/repositories/wss_repository/wss_repository_interface.dart';
import 'package:moll/services/wss_service/wss_service_interface.dart';
import 'package:rxdart/rxdart.dart';

class WSSRepository extends WSSRepositoryInterface{
  WSSServiceInterface wssService;
  WSSRepository({required this.wssService});

  @override
  Stream<HostItem?> checkHost(String host)async* {
    Socket socket = await wssService.connect(host, port: 9000);
    BehaviorSubject<HostItem?> controller = BehaviorSubject<HostItem?>();
    yield* controller;
    socket.listen((event) {
      String mess = String.fromCharCodes(event).trim();
      try{
        ESPInfo espInfo = ESPInfo.fromJson(json.decode(mess));
        controller.add(HostItem(ip: host, name: espInfo.name, number: espInfo.number));
      }catch(e){
        controller.sink.add(null);
      }
      controller.close();
    });




  }


}
import 'dart:io';

import 'package:moll/services/wss_service/wss_service_interface.dart';

class WSSService extends WSSServiceInterface{
  @override
  Future<Socket> connect(String host, {required int port})async {
    return await Socket.connect(host, port);
  }

}
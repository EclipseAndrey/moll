import 'dart:io';

abstract class WSSServiceInterface{
  Future<Socket> connect (String host, {required int port});
}
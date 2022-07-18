import 'package:moll/models/host_item.dart';

abstract class WSSRepositoryInterface{
  List<HostItem> hosts = [];
  Stream<HostItem?> checkHost(String host);
}
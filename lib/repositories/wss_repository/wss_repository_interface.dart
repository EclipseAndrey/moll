import 'package:moll/models/host_item.dart';

abstract class WSSRepositoryInterface{
  Stream<HostItem?> checkHost(String host);
}
import 'package:moll/scanner/src/host_scanner.dart';
import 'package:moll/scanner/src/models/active_host.dart';
import 'package:moll/services/scan_service/scan_service_interface.dart';
import 'package:network_info_plus/network_info_plus.dart';
class ScanService extends ScanServiceInterface {

  @override
  Stream<ActiveHost> getScanStream() async*{
    final info = NetworkInfo();
    final String ip = await info.getWifiIP()??"192.168.0.1";
    final String subnet = ip.substring(0, ip.lastIndexOf('.'));
    const int port = 80;
    final stream = HostScanner.discover(subnet,
        resultsInIpAscendingOrder: true,
        progressCallback: (progress) {
      print('Progress for host discovery : $progress');
    });
    yield* stream;
  }

}

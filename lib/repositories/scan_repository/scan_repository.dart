
import 'package:moll/repositories/scan_repository/scan_repository_interface.dart';
import 'package:moll/services/scan_service/scan_service_interface.dart';
import 'package:moll/scanner/scanner.dart';

class ScanRepository extends ScanRepositoryInterface{
  final ScanServiceInterface scanService;
  ScanRepository({required this.scanService});

  @override
  Stream<ActiveHost> getScanStream()async* {
    yield* scanService.getScanStream();
  }

}
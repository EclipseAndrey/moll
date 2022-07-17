import 'package:moll/scanner/scanner.dart';

abstract class ScanRepositoryInterface{
  Stream<ActiveHost> getScanStream();
}
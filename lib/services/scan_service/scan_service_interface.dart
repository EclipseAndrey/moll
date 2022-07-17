
import 'package:moll/scanner/scanner.dart';

abstract class ScanServiceInterface{
  Stream<ActiveHost> getScanStream();
}
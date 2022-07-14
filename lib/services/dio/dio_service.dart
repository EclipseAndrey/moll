import 'package:moll/services/dio/dio_service_interface.dart';
import 'package:moll/support/dio/dio_factory.dart';

class DioService implements DioServiceInterface {
  DioFactory dio;
  DioService({required this.dio});

  @override
  String get token => dio.dio.options.headers['authorization'];
}

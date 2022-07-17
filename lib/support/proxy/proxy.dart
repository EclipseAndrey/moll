import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:moll/support/constants/app_settings.dart';

part 'proxy_paths.dart';

class MollProxy extends HttpOverrides {


  static Future<List<ByteData>> getSelfSigningCertificates()async{
    List<ByteData> _certificates = [];
    for(String fileName in SelfSigningCertificates){
      ByteData _data = await rootBundle.load(pathToCertificatesDirectory+ fileName);
      _certificates.add(_data);
    }
    return _certificates;
  }

  final List<ByteData> certs;

  MollProxy(this.certs);

  @override
  HttpClient createHttpClient(SecurityContext? context) {

    /// Установка сертификатов

    for(String fileName in GlobalCertificates){
      context?.setTrustedCertificates(absolutePath+pathToCertificatesDirectory+fileName);
    }

    HttpClient client = super.createHttpClient(context);
    // client.maxConnectionsPerHost = 1000;

    if(!Platform.isAndroid) {
      /// Подключить прокси (не работает на ведре)
      client.findProxy = (uri) {
        return "PROXY localhost:8888;";
      };
    }

    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      bool hasFindCert = false;
      final List<int> serverCert =cert.pem.codeUnits;
      List<int> localStepCert;

      /// Перводим сертификат сервера в байты [serverCert]
      /// Далее циклично проходимся по выбранным сертификатам ([certs])
      /// Поочередно сверяя байты каждого [localStepCert] с сертификатом сервера
      ///
      /// Если во время сверки одного из сертификатов получаем расхождения
      /// выставляем [equatable] значение false, тем самым прерывая проверку
      /// текущего сертификата
      ///
      /// Если по окончанию проверки очередного сертификата получаем положительный
      /// результа ([equatable] == true)
      /// Прерываем цикл проверки задав
      /// [hasFindCert] = true
      ///
      /// И возвращаем [hasFindCert] в качестве результата проверки полученного
      /// сервером сертификата

      for(int stepData = 0; stepData < certs.length && !hasFindCert; stepData++){
        bool equatable = true;
        localStepCert = certs[stepData].buffer.asUint8List().toList();
        if(serverCert.length != localStepCert.length){
          equatable = false;
        }
        for(int i =0; i < serverCert.length && i<localStepCert.length && equatable; i++){
          if(serverCert[i] != localStepCert[i]) equatable = false;
        }
        if(equatable) hasFindCert = true;
      }
      return AppSettings.disableCERTS?true:hasFindCert;
    };
    return client;
  }

}

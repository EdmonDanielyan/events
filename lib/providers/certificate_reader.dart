import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CertificateReader {
  late Uint8List _natsCertificateData;
  late Uint8List _apiCertificateData;

  Uint8List get natsCertificateData => _natsCertificateData;
  Uint8List get apiCertificateData => _apiCertificateData;

  Future<void> read() async {
    _natsCertificateData =
        (await rootBundle.load(GetIt.I(instanceName: 'natsCertificatePath')))
            .buffer
            .asUint8List();
    _apiCertificateData =
        (await rootBundle.load(GetIt.I(instanceName: 'apiCertificatePath')))
            .buffer
            .asUint8List();
  }
}

@module
abstract class CertificateInjector {
  @Named("natsCertificate")
  Uint8List get natsCertificate =>
      GetIt.I<CertificateReader>().natsCertificateData;

  @Named("apiCertificate")
  Uint8List get apiCertificate =>
      GetIt.I<CertificateReader>().apiCertificateData;
}

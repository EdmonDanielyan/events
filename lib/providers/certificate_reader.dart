import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CertificateReader {
  late Uint8List _natsCertificateData;
  Uint8List get natsCertificateData => _natsCertificateData;

  Future<void> read() async {
    _natsCertificateData =
        (await rootBundle.load(GetIt.I(instanceName: 'natsCertificatePath')))
            .buffer
            .asUint8List();
  }
}

@module
abstract class CertificateInjector {
  @Named("natsCertificate")
  Uint8List get natsCertificate =>
      GetIt.I<CertificateReader>().natsCertificateData;
}

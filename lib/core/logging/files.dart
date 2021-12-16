import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class LogFilePathInjector {
  @preResolve
  @prod
  @dev
  @Named('logFile')
  Future<String> get logFile async => (await getApplicationDocumentsDirectory()).path + '/application.log';
}

@module
abstract class TestLogFilePathInjector {
  @test
  @Named('logFile')
  String get logFile => 'application.log';
}
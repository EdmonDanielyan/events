import 'package:injectable/injectable.dart';
import 'package:ink_mobile/setup.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class LogFilePathInjector {
  @preResolve
  @test
  @prod
  @dev
  @Named('logFile')
  Future<String> get logFile async =>
      '${(await getApplicationDocumentsDirectory()).path}/application.log';
}

@module
abstract class TestLogFilePathInjector {
  @unitTest
  @Named('logFile')
  String get logFile => 'application.log';
}

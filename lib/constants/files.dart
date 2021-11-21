import 'package:injectable/injectable.dart';

@module
abstract class FileConstants {
  @Named('logFile')
  String get logFile => 'application.log';
}
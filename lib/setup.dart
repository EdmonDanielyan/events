import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'setup.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  $initGetIt(sl);
}

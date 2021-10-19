import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/core/errors/errors_to_server.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/handlers/error_catcher.dart';
import 'package:ink_mobile/providers/global_providers.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/routes/routes.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/themes/light.dart';

import 'cubit/boot/boot_cubit.dart';

void main() async {
  await setup();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      ErrorsToServer(
        error: details.exception.toString(),
        stack: details.stack.toString(),
      ).send();
      // exit(1);
    };
    runApp(InkMobile(onAppStart: () async {
      NatsProvider natsProvider = sl<NatsProvider>();
      return await natsProvider.load();
    }));
  }, (Object error, StackTrace stack) {
    if (error is CustomException) {
      ErrorCatcher catcher = ErrorCatcher.getInstance();

      catcher.onError(error, stack);
    } else {
      print(error);
      print(stack.toString());
      showErrorDialog(ErrorMessages.UNKNOWN_ERROR_MESSAGE);
    }
  });
}

class InkMobile extends StatelessWidget {
  final Future<bool> Function()? onAppStart;
  late final BootCubit bootCubit;

  InkMobile({Key? key, this.onAppStart}) : super(key: key) {
    bootCubit = GetIt.I<BootCubit>()..onStart = onAppStart!;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: GlobalProvider.getProviders(context).cast(),
      child: MaterialApp(
        navigatorKey: App.materialKey,
        title: 'ИНК',
        initialRoute: '/init',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ru'),
        ],
        routes: MainRoutes.routes,
        theme: LightTheme().getThemeData(),
        darkTheme: LightTheme().getThemeData(),
      ),
    );
  }
}

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/handlers/error_catcher.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/global_providers.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/routes/routes.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/themes/light.dart';
import 'package:logging/logging.dart';

import 'cubit/boot/boot_cubit.dart';

void main() async {
  runZonedGuarded(() async {
    //todo: Раскомментировать на релизе
    // await setup(scope: kReleaseMode ? "prod" : "dev" );
    await setup(scope: "dev");

    runApp(InkMobile(onAppStart: () async {
      await sl<Messenger>().init();
      return true;
    }));
  }, (Object error, StackTrace stack) {
    if (error is CustomException) {
      ErrorCatcher catcher = ErrorCatcher.getInstance();
      catcher.onError(error, stack);
    } else {
      Logger('general').severe('Unexpected error', error, stack);
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

    return
      // callback: startCallback,
      MultiBlocProvider(
        providers: GlobalProvider.getProviders(context).cast(),
        child: MaterialApp(
          navigatorKey: App.materialKey,
          title: 'ИНК',
          initialRoute: '/init',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: I18n.all,
          routes: MainRoutes.routes,
          theme: LightTheme().getThemeData(),
          darkTheme: LightTheme().getThemeData(),
        ),
    );
  }
}

// The callback function should always be a top-level function.
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
}

class FirstTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    // You can use the getData function to get the data you saved.
    final customData = await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    // Send data to the main isolate.
    sendPort?.send(timestamp);
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    // You can use the clearAllData function to clear all the stored data.
    await FlutterForegroundTask.clearAllData();
  }

  @override
  void onButtonPressed(String id) {
    // Called when the notification button on the Android platform is pressed.
    print('onButtonPressed >> $id');
  }
}

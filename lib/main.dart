import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    await setup(scope: kReleaseMode ? "prod" : "dev" );

    runApp(InkMobile(onAppStart: () async {
      return await UseMessageProvider.initMessageProvider();
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

    return MultiBlocProvider(
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

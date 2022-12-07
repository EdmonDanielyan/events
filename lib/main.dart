import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/firebase_options.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/global_providers.dart';
import 'package:ink_mobile/routes/routes.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/themes/light.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    HttpOverrides.global = MyHttpOverrides();
    final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    );

    HydratedBlocOverrides.runZoned(
      () async {
        await setup(scope: await readEnv());

        runApp(InkMobile());
      },
      storage: storage,
    );
  }, (error, stack) {});

  OneSignal.shared.setAppId("4a08e645-b5e8-434d-9c5c-5280e7e49048");

  //TODO: update with In-App message
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}

class InkMobile extends StatelessWidget {
  const InkMobile({Key? key}) : super(key: key);

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
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

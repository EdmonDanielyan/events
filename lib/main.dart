import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/global_providers.dart';
import 'package:ink_mobile/routes/routes.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/themes/light.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runZoned(
    () {
      runZonedGuarded(
        () async {
          WidgetsFlutterBinding.ensureInitialized();

          HttpOverrides.global = MyHttpOverrides();
          HydratedBloc.storage = await HydratedStorage.build(
            storageDirectory: kIsWeb
                ? HydratedStorage.webStorageDirectory
                : await getTemporaryDirectory(),
          );

          await setup();

          runApp(const InkMobile());
        },
        (error, stack) {},
      );
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        if (kDebugMode) {
          parent.print(zone, line);
        }
      },
    ),
  );
}

class InkMobile extends StatelessWidget {
  const InkMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
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

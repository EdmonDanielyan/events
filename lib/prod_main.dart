import 'dart:async';
import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/firebase_options.dart';
import 'package:ink_mobile/setup.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'ink_app.dart';
import 'utils/my_http_overrides.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    HttpOverrides.global = MyHttpOverrides();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    );

    await writeEnv(Environment.prod);

    await setup();
    runApp(const InkMobile());
  }, (error, stack) {});

  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.setAppId("4a08e645-b5e8-434d-9c5c-5280e7e49048");
  OneSignal.initialize("4a08e645-b5e8-434d-9c5c-5280e7e49048");

  //TODO: update with In-App message
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //   print("Accepted permission: $accepted");
  // });
  OneSignal.Notifications.requestPermission(true).then((accepted) {
    print("Accepted permission: $accepted");
  });

  // AppMetrica.activate(
  //     const AppMetricaConfig("3948ed67-c81f-4920-ad3a-bd4b70a59376"));
}

import 'dart:async';
import 'dart:io';

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

    await writeEnv(Environment.dev);

    await setup();

    runApp(const InkMobile());
  }, (error, stack) {});

  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  // comment by migration from 3.5.0
  // OneSignal.shared.setAppId("19ca1218-8cd7-4aef-b24a-bb36a6b05cdd");
  // to
  OneSignal.initialize("19ca1218-8cd7-4aef-b24a-bb36a6b05cdd");

  //TODO: update with In-App message
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //   print("Accepted permission: $accepted");
  // });
  OneSignal.Notifications.requestPermission(true).then((accepted) {
    print("Accepted permission: $accepted");
  });

  //AppMetrica.activate(AppMetricaConfig("3948ed67-c81f-4920-ad3a-bd4b70a59376"));
}

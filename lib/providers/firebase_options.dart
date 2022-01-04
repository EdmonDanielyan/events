// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRVQpIRsoiO0pQJJHTq0MG4Cqza5mBahE',
    appId: '1:293227396933:android:20271600f9c5f7b9c2482c',
    messagingSenderId: '293227396933',
    projectId: 'ink-mobile-9dc08',
    storageBucket: 'ink-mobile-9dc08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQlOmRoO0IitiL7u5ALRHaCZR_znv47fo',
    appId: '1:293227396933:ios:ed306d439355a996c2482c',
    messagingSenderId: '293227396933',
    projectId: 'ink-mobile-9dc08',
    storageBucket: 'ink-mobile-9dc08.appspot.com',
    iosClientId: '293227396933-ot08hd0iuloijr0lrml0c6va5nad3gvt.apps.googleusercontent.com',
    iosBundleId: 'ru.irkutsoil.portal',
  );
}

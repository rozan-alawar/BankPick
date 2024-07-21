// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
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
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDRhx9ETzoCi87NOuPnVXPnP7YbMbGX9Pw',
    appId: '1:1076325647622:web:fdfc52d4a39e00c048ca87',
    messagingSenderId: '1076325647622',
    projectId: 'bankpick-application',
    authDomain: 'bankpick-application.firebaseapp.com',
    storageBucket: 'bankpick-application.appspot.com',
    measurementId: 'G-LGDP0QJRKK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1raLL3pAzekttlJy2i8tUa-MV8jfdBAg',
    appId: '1:1076325647622:android:aea5c611b327feb848ca87',
    messagingSenderId: '1076325647622',
    projectId: 'bankpick-application',
    storageBucket: 'bankpick-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZmm6iMumI5b2OWvJHOfWLAdnJubm5lys',
    appId: '1:1076325647622:ios:f0918306e1c765e248ca87',
    messagingSenderId: '1076325647622',
    projectId: 'bankpick-application',
    storageBucket: 'bankpick-application.appspot.com',
    iosBundleId: 'com.example.dakakeen',
  );
}

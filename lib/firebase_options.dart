// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyDDHAC8jU36BNb0zefuWG5bJXt7pRhwvMc',
    appId: '1:818073158552:web:200950fd63ab17a04721ed',
    messagingSenderId: '818073158552',
    projectId: 'travel-app-46fcd',
    authDomain: 'travel-app-46fcd.firebaseapp.com',
    storageBucket: 'travel-app-46fcd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjcMzCfHMpnZ0TwWFEBDBbOWekjewlIzA',
    appId: '1:818073158552:android:7c14dbac80b6d7474721ed',
    messagingSenderId: '818073158552',
    projectId: 'travel-app-46fcd',
    storageBucket: 'travel-app-46fcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYyBK6qsY4AhJDlwUBRrB2bBRmcAKdvyQ',
    appId: '1:818073158552:ios:54121005f2fde86e4721ed',
    messagingSenderId: '818073158552',
    projectId: 'travel-app-46fcd',
    storageBucket: 'travel-app-46fcd.appspot.com',
    iosClientId: '818073158552-4t3jvpfu7qeu2ssqjq135dis8soa08j9.apps.googleusercontent.com',
    iosBundleId: 'com.example.trivo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYyBK6qsY4AhJDlwUBRrB2bBRmcAKdvyQ',
    appId: '1:818073158552:ios:5a37c662544d0fae4721ed',
    messagingSenderId: '818073158552',
    projectId: 'travel-app-46fcd',
    storageBucket: 'travel-app-46fcd.appspot.com',
    iosClientId: '818073158552-hutp5lkq0b58g8b6qmuqut2khesbdlo9.apps.googleusercontent.com',
    iosBundleId: 'com.example.trivo.RunnerTests',
  );
}

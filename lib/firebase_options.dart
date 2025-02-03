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
    apiKey: 'AIzaSyDfg6qn9jidYaoqL4UF8olYsREq7ujRLtE',
    appId: '1:57724606697:web:7e0b391505b32aad4c7878',
    messagingSenderId: '57724606697',
    projectId: 'homedecor-2533b',
    authDomain: 'homedecor-2533b.firebaseapp.com',
    storageBucket: 'homedecor-2533b.firebasestorage.app',
    measurementId: 'G-1R1M9DR0BR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1-yHNkYbvW_gEFLtDmatHOc36Lng85-g',
    appId: '1:57724606697:android:5cfa2ad54bb8afd84c7878',
    messagingSenderId: '57724606697',
    projectId: 'homedecor-2533b',
    storageBucket: 'homedecor-2533b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2SQf_M1UZ9WPanjmldSfe53CQXyC48Rs',
    appId: '1:57724606697:ios:4bd1dfe3ae30a0ac4c7878',
    messagingSenderId: '57724606697',
    projectId: 'homedecor-2533b',
    storageBucket: 'homedecor-2533b.firebasestorage.app',
    iosBundleId: 'com.example.homedecorShoppingApp',
  );
}

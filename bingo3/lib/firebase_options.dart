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
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3L_KCHm96PzEpAos5L5fteqwiKZyW6IQ',
    appId: '1:1010019863680:web:361804577eec4ffeec2a65',
    messagingSenderId: '1010019863680',
    projectId: 'bingo-75d49',
    authDomain: 'bingo-75d49.firebaseapp.com',
    databaseURL: 'https://bingo-75d49-default-rtdb.firebaseio.com',
    storageBucket: 'bingo-75d49.firebasestorage.app',
    measurementId: 'G-9C9WWS4ZFN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFXAL1MC7kMFWfGRZgnQHbHIMSyoz3mEM',
    appId: '1:1010019863680:android:6d952931ad26a1a3ec2a65',
    messagingSenderId: '1010019863680',
    projectId: 'bingo-75d49',
    databaseURL: 'https://bingo-75d49-default-rtdb.firebaseio.com',
    storageBucket: 'bingo-75d49.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwpdJ1eJ-DP8w_OuS29uVpDriORo8dQ_s',
    appId: '1:1010019863680:ios:1fc1f6cb8af495a1ec2a65',
    messagingSenderId: '1010019863680',
    projectId: 'bingo-75d49',
    databaseURL: 'https://bingo-75d49-default-rtdb.firebaseio.com',
    storageBucket: 'bingo-75d49.firebasestorage.app',
    iosBundleId: 'com.thecwadley.bingo3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3L_KCHm96PzEpAos5L5fteqwiKZyW6IQ',
    appId: '1:1010019863680:web:361804577eec4ffeec2a65',
    messagingSenderId: '1010019863680',
    projectId: 'bingo-75d49',
    authDomain: 'bingo-75d49.firebaseapp.com',
    databaseURL: 'https://bingo-75d49-default-rtdb.firebaseio.com',
    storageBucket: 'bingo-75d49.firebasestorage.app',
    measurementId: 'G-9C9WWS4ZFN',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyC3L_KCHm96PzEpAos5L5fteqwiKZyW6IQ',
    appId: '1:1010019863680:web:836c9c27fac3d0eaec2a65',
    messagingSenderId: '1010019863680',
    projectId: 'bingo-75d49',
    authDomain: 'bingo-75d49.firebaseapp.com',
    databaseURL: 'https://bingo-75d49-default-rtdb.firebaseio.com',
    storageBucket: 'bingo-75d49.firebasestorage.app',
    measurementId: 'G-G9KLY74PK9',
  );

}
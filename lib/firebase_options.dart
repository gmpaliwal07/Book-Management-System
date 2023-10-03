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
    apiKey: 'AIzaSyDQRyXle0hsNwouIWnfv32UZr9zeXuIYQk',
    appId: '1:749443606700:web:169269abf842e9b9df1709',
    messagingSenderId: '749443606700',
    projectId: 'bank-management-system-b5150',
    authDomain: 'bank-management-system-b5150.firebaseapp.com',
    storageBucket: 'bank-management-system-b5150.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXB7_BxGbw0sLFk6Ly5RsKhZgst9XHk34',
    appId: '1:749443606700:android:242e9465536bb5a0df1709',
    messagingSenderId: '749443606700',
    projectId: 'bank-management-system-b5150',
    storageBucket: 'bank-management-system-b5150.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSaJUaMVl3uZXiFZagSL4byTG850cqswA',
    appId: '1:749443606700:ios:d5e967fa4758e149df1709',
    messagingSenderId: '749443606700',
    projectId: 'bank-management-system-b5150',
    storageBucket: 'bank-management-system-b5150.appspot.com',
    iosBundleId: 'com.example.bookmanagementsystem',
  );
}
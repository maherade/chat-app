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
    apiKey: 'AIzaSyB50EM_mvNFnQ70mwM1gMtSZyJLkOJZmEA',
    appId: '1:628127130935:web:2f5492fb6289f16f61e6b2',
    messagingSenderId: '628127130935',
    projectId: 'chat-app-de6a0',
    authDomain: 'chat-app-de6a0.firebaseapp.com',
    storageBucket: 'chat-app-de6a0.appspot.com',
    measurementId: 'G-9DBY69N1YK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYdLDfWFYPEGVE2mfWQ7SK1msgk-LdIm8',
    appId: '1:628127130935:android:fac3a8563b431dc061e6b2',
    messagingSenderId: '628127130935',
    projectId: 'chat-app-de6a0',
    storageBucket: 'chat-app-de6a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-QsvWkf_atlR8qfAMFUsziacS7o7VfhI',
    appId: '1:628127130935:ios:02ff5308b314546761e6b2',
    messagingSenderId: '628127130935',
    projectId: 'chat-app-de6a0',
    storageBucket: 'chat-app-de6a0.appspot.com',
    iosClientId:
        '628127130935-l76is0i3seaeq30fp39qfr0bmkjdqrvi.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-QsvWkf_atlR8qfAMFUsziacS7o7VfhI',
    appId: '1:628127130935:ios:02ff5308b314546761e6b2',
    messagingSenderId: '628127130935',
    projectId: 'chat-app-de6a0',
    storageBucket: 'chat-app-de6a0.appspot.com',
    iosClientId:
        '628127130935-l76is0i3seaeq30fp39qfr0bmkjdqrvi.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );
}
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
    apiKey: 'AIzaSyDf7QV38z6yNLuTjZ3sbRHdsqk33DHCM6s',
    appId: '1:603989338203:web:1e2d16ae916cb650ce377e',
    messagingSenderId: '603989338203',
    projectId: 'chat-app-87738',
    authDomain: 'chat-app-87738.firebaseapp.com',
    storageBucket: 'chat-app-87738.appspot.com',
    measurementId: 'G-G2M2F2MKGL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-ha_N0usaJEqbkgWk78Ib_0jZCrBeiQk',
    appId: '1:603989338203:android:89362e645571b06ace377e',
    messagingSenderId: '603989338203',
    projectId: 'chat-app-87738',
    storageBucket: 'chat-app-87738.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCtgwTvt48NXaf1nS0EhpReCPpsFv2ZHs',
    appId: '1:603989338203:ios:e639c3ebb3e9ccffce377e',
    messagingSenderId: '603989338203',
    projectId: 'chat-app-87738',
    storageBucket: 'chat-app-87738.appspot.com',
    iosClientId: '603989338203-f8pii73q3vij6r45io3cggmphbd47hav.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}

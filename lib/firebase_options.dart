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
    apiKey: 'AIzaSyDDudak5Ul7EIica4MKKMNXvuJbwlnges0',
    appId: '1:593676533450:web:c1e1fea2aca9058aabfe33',
    messagingSenderId: '593676533450',
    projectId: 'battleshipsfirebase',
    authDomain: 'battleshipsfirebase.firebaseapp.com',
    databaseURL: 'https://battleshipsfirebase-default-rtdb.firebaseio.com',
    storageBucket: 'battleshipsfirebase.appspot.com',
    measurementId: 'G-BEDXGW2020',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR-vEYUvKmwC5jFj0X6ZkEOwnPwzFi84U',
    appId: '1:593676533450:android:5db278c3bd39b261abfe33',
    messagingSenderId: '593676533450',
    projectId: 'battleshipsfirebase',
    databaseURL: 'https://battleshipsfirebase-default-rtdb.firebaseio.com',
    storageBucket: 'battleshipsfirebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiDSwo_8uKe3Dai1AjYvjrgq8WqpUXzHM',
    appId: '1:593676533450:ios:f6c4b91cca970d33abfe33',
    messagingSenderId: '593676533450',
    projectId: 'battleshipsfirebase',
    databaseURL: 'https://battleshipsfirebase-default-rtdb.firebaseio.com',
    storageBucket: 'battleshipsfirebase.appspot.com',
    iosClientId: '593676533450-vce6m0tm4303vps3guu5eihn965u8dg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.battleships',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiDSwo_8uKe3Dai1AjYvjrgq8WqpUXzHM',
    appId: '1:593676533450:ios:f6c4b91cca970d33abfe33',
    messagingSenderId: '593676533450',
    projectId: 'battleshipsfirebase',
    databaseURL: 'https://battleshipsfirebase-default-rtdb.firebaseio.com',
    storageBucket: 'battleshipsfirebase.appspot.com',
    iosClientId: '593676533450-vce6m0tm4303vps3guu5eihn965u8dg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.battleships',
  );
}

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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyArNq8MX2zKH4XE3lef0OQsfgH6W0pXf_Q',
    appId: '1:534439108970:web:02a0df6141d6e9f7778513',
    messagingSenderId: '534439108970',
    projectId: 'tecnosoft-226cf',
    authDomain: 'tecnosoft-226cf.firebaseapp.com',
    storageBucket: 'tecnosoft-226cf.appspot.com',
    measurementId: 'G-V45771YDYS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcEuVlCjHg6JvKzt3AkxKCgtmSdm24xwA',
    appId: '1:534439108970:android:f287e569b5fcf40b778513',
    messagingSenderId: '534439108970',
    projectId: 'tecnosoft-226cf',
    storageBucket: 'tecnosoft-226cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmE95KauWmb2pgeVAwIrXt3qVvzu-U_FM',
    appId: '1:534439108970:ios:e4d6cf16d339e2c7778513',
    messagingSenderId: '534439108970',
    projectId: 'tecnosoft-226cf',
    storageBucket: 'tecnosoft-226cf.appspot.com',
    iosClientId: '534439108970-kqoilqgfc190tnbkk3guefctqustdavn.apps.googleusercontent.com',
    iosBundleId: 'com.example.tecnosoftTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmE95KauWmb2pgeVAwIrXt3qVvzu-U_FM',
    appId: '1:534439108970:ios:e4d6cf16d339e2c7778513',
    messagingSenderId: '534439108970',
    projectId: 'tecnosoft-226cf',
    storageBucket: 'tecnosoft-226cf.appspot.com',
    iosClientId: '534439108970-kqoilqgfc190tnbkk3guefctqustdavn.apps.googleusercontent.com',
    iosBundleId: 'com.example.tecnosoftTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyArNq8MX2zKH4XE3lef0OQsfgH6W0pXf_Q',
    appId: '1:534439108970:web:a8ac0b4bd8aa5b79778513',
    messagingSenderId: '534439108970',
    projectId: 'tecnosoft-226cf',
    authDomain: 'tecnosoft-226cf.firebaseapp.com',
    storageBucket: 'tecnosoft-226cf.appspot.com',
    measurementId: 'G-QD12X07VBM',
  );
}

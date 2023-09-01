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
    apiKey: 'AIzaSyAgU3_mgQNpgR4d66XNb7Tegkdz2ikf0mc',
    appId: '1:587050558198:web:65dbe1204d05b59c3b02d7',
    messagingSenderId: '587050558198',
    projectId: 'uber-clone-c809d',
    authDomain: 'uber-clone-c809d.firebaseapp.com',
    storageBucket: 'uber-clone-c809d.appspot.com',
    measurementId: 'G-B3V7PM2RN4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5NWG9fpjHO8ukBaXei7sCyEk1beGIPKE',
    appId: '1:587050558198:android:c4cdfaa3c33fd6903b02d7',
    messagingSenderId: '587050558198',
    projectId: 'uber-clone-c809d',
    storageBucket: 'uber-clone-c809d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrzrSmwi4-jkCY2GZNdRCXNygPWcHrhRQ',
    appId: '1:587050558198:ios:831ac0024e5dac353b02d7',
    messagingSenderId: '587050558198',
    projectId: 'uber-clone-c809d',
    storageBucket: 'uber-clone-c809d.appspot.com',
    iosClientId: '587050558198-3d2ika7ev16g0ri5fdl5s4o2t1oiusrg.apps.googleusercontent.com',
    iosBundleId: 'com.example.driversApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrzrSmwi4-jkCY2GZNdRCXNygPWcHrhRQ',
    appId: '1:587050558198:ios:643a676edc87f74f3b02d7',
    messagingSenderId: '587050558198',
    projectId: 'uber-clone-c809d',
    storageBucket: 'uber-clone-c809d.appspot.com',
    iosClientId: '587050558198-tnn2ejclq6rseimr9a737oveq394ibdc.apps.googleusercontent.com',
    iosBundleId: 'com.example.driversApp.RunnerTests',
  );
}

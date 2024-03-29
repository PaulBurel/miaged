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
    apiKey: 'AIzaSyD6nsUHjNlVXa-6xGFxkWjxXme61ZAcPcg',
    appId: '1:924265641322:web:fc041fe2200a8b3b01e113',
    messagingSenderId: '924265641322',
    projectId: 'projetflutterm2',
    authDomain: 'projetflutterm2.firebaseapp.com',
    storageBucket: 'projetflutterm2.appspot.com',
    measurementId: 'G-X00N1Z2XXH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvHUQAfVyI8TMCM1ROjbkK25DPeu71pHY',
    appId: '1:924265641322:android:c0496934a03a379201e113',
    messagingSenderId: '924265641322',
    projectId: 'projetflutterm2',
    storageBucket: 'projetflutterm2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNFzjixYFDZYPEousAksi190UbAgzCE54',
    appId: '1:924265641322:ios:625a43747ae15d4801e113',
    messagingSenderId: '924265641322',
    projectId: 'projetflutterm2',
    storageBucket: 'projetflutterm2.appspot.com',
    iosClientId: '924265641322-6iacjfks79ujauohc8sd1pb9jij4dlje.apps.googleusercontent.com',
    iosBundleId: 'com.example.miage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNFzjixYFDZYPEousAksi190UbAgzCE54',
    appId: '1:924265641322:ios:625a43747ae15d4801e113',
    messagingSenderId: '924265641322',
    projectId: 'projetflutterm2',
    storageBucket: 'projetflutterm2.appspot.com',
    iosClientId: '924265641322-6iacjfks79ujauohc8sd1pb9jij4dlje.apps.googleusercontent.com',
    iosBundleId: 'com.example.miage',
  );
}

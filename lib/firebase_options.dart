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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjUPUA5MGSIp3pycKAia1B6fwzAkNhJYU',
    appId: '1:47861574637:android:e5da7f9e6a3928dd5015e4',
    messagingSenderId: '47861574637',
    projectId: 'vizio-5bff3',
    databaseURL: 'https://vizio-5bff3-default-rtdb.firebaseio.com',
    storageBucket: 'vizio-5bff3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALaNB4cN58pcI-0Dxhz8SLKoNjIHIe_G4',
    appId: '1:47861574637:ios:1eb3dce6731c21a45015e4',
    messagingSenderId: '47861574637',
    projectId: 'vizio-5bff3',
    databaseURL: 'https://vizio-5bff3-default-rtdb.firebaseio.com',
    storageBucket: 'vizio-5bff3.appspot.com',
    iosClientId: '47861574637-t3q18ngc7mb0qva5ja6jkiirqe5n4i6s.apps.googleusercontent.com',
    iosBundleId: 'tn.vizio.vizio',
  );
}

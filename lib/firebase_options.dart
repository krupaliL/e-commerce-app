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
    apiKey: 'AIzaSyB6qoXqPOFsR1yvsb-tlOzURDCMv1mDFfU',
    appId: '1:647813439005:android:b2d6c542bc7d11a454f0f4',
    messagingSenderId: '647813439005',
    projectId: 'ecommerceapp-24a3c',
    storageBucket: 'ecommerceapp-24a3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA91YF7YkfOZ1yrpgtrOAZU44tTLRE2P7c',
    appId: '1:647813439005:ios:6a98eddca3569ca654f0f4',
    messagingSenderId: '647813439005',
    projectId: 'ecommerceapp-24a3c',
    storageBucket: 'ecommerceapp-24a3c.appspot.com',
    androidClientId: '647813439005-uu0pg69kef6nnfsdiisqenvgct8v6785.apps.googleusercontent.com',
    iosClientId: '647813439005-6remvj80dclhi1frsvls5624us0h7lio.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

}
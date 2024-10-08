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
    apiKey: 'AIzaSyA9tGiKqi0S2gBuF9cba6tVk8tQDhRvilM',
    appId: '1:386010937516:web:75ccfd2a3cd52ff4614709',
    messagingSenderId: '386010937516',
    projectId: 'recipe-saver-flutter',
    authDomain: 'recipe-saver-flutter.firebaseapp.com',
    storageBucket: 'recipe-saver-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC35610cT2nm0w8rTzVzvXhGjniTl_2cB0',
    appId: '1:386010937516:android:bf3dd82aad35f119614709',
    messagingSenderId: '386010937516',
    projectId: 'recipe-saver-flutter',
    storageBucket: 'recipe-saver-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-Vi8ojUUSzwsxpMdtaf1acAuZe_D_eQI',
    appId: '1:386010937516:ios:63829492f230b021614709',
    messagingSenderId: '386010937516',
    projectId: 'recipe-saver-flutter',
    storageBucket: 'recipe-saver-flutter.appspot.com',
    iosClientId: '386010937516-178knkj0c4qd6d42gdneqepikojivda9.apps.googleusercontent.com',
    iosBundleId: 'com.example.recipieSaverFlutter',
  );
}

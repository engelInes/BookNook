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
    apiKey: 'AIzaSyAiGRvT-_VoVP_rtpCFI37y9Xl1K40x6_4',
    appId: '1:776811734494:web:4d7b63aa9f55ad3f3be94f',
    messagingSenderId: '776811734494',
    projectId: 'bookapp-ef6a3',
    authDomain: 'bookapp-ef6a3.firebaseapp.com',
    storageBucket: 'bookapp-ef6a3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADIiHHzA7SBiRUqo9FqlrJRvEcRhCT7Bg',
    appId: '1:776811734494:android:db67a8e02f6ba2f03be94f',
    messagingSenderId: '776811734494',
    projectId: 'bookapp-ef6a3',
    storageBucket: 'bookapp-ef6a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIrYj8L43M2BoBJBHb3tZj7TTKVSVrLiI',
    appId: '1:776811734494:ios:c0bbf011cc8711a83be94f',
    messagingSenderId: '776811734494',
    projectId: 'bookapp-ef6a3',
    storageBucket: 'bookapp-ef6a3.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIrYj8L43M2BoBJBHb3tZj7TTKVSVrLiI',
    appId: '1:776811734494:ios:dfadbe653fd388743be94f',
    messagingSenderId: '776811734494',
    projectId: 'bookapp-ef6a3',
    storageBucket: 'bookapp-ef6a3.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}

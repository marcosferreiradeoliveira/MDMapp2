import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions não configuradas para web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError('FirebaseOptions não configuradas para macOS.');
      case TargetPlatform.windows:
        throw UnsupportedError(
            'FirebaseOptions não configuradas para Windows.');
      case TargetPlatform.linux:
        throw UnsupportedError('FirebaseOptions não configuradas para Linux.');
      default:
        throw UnsupportedError('Plataforma não suportada.');
    }
  }

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['API_KEY_ANDROID'] ?? '',
    appId: dotenv.env['APP_ID_ANDROID'] ?? '',
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['STORAGE_BUCKET'] ?? '',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['API_KEY_IOS'] ?? '', // 🔥 Corrigido!
    appId: dotenv.env['APP_ID_IOS'] ?? '',
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['STORAGE_BUCKET'] ?? '',
    iosClientId: dotenv.env['IOS_CLIENT_ID'] ?? '',
    iosBundleId: dotenv.env['IOS_BUNDLE_ID'] ?? '',
  );
}

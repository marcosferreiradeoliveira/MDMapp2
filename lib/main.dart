import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/blog_bloc.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/blocs/state_bloc.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';
import 'package:travel_hour/pages/home.dart';
import 'package:flutter/foundation.dart'; // Add this import

Future<void> initializeFirebase() async {
  try {
    // Most reliable way to handle initialization
    if (Firebase.apps.isEmpty) {
      print("🔥 Initializing Firebase...");
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print("🔥 Firebase initialized successfully");
    } else {
      print("🔥 Using existing Firebase app: ${Firebase.app().name}");
    }

    // Service connection tests
    final app = Firebase.app();
    print("🔥 Using Firebase app: ${app.name}");
    print("🔥 Project ID: ${app.options.projectId}");

    // Test connections (with more detailed error reporting)
    await _testFirestoreConnection();
    await _testStorageConnection();
    await _testAuthConnection();
  } catch (e, stackTrace) {
    print("⚠️ Critical Firebase error: $e");
    print("Stack trace: $stackTrace");
    rethrow;
  }
}

Future<void> _testFirestoreConnection() async {
  try {
    await FirebaseFirestore.instance.collection('test').limit(1).get();
    print("✅ Firestore connection successful");
  } catch (e) {
    print("❌ Firestore connection failed: ${e.toString()}");
  }
}

Future<void> _testStorageConnection() async {
  try {
    await FirebaseStorage.instance.ref().listAll();
    print("✅ Storage connection successful");
  } catch (e) {
    print("❌ Storage connection failed: ${e.toString()}");
  }
}

Future<void> _testAuthConnection() async {
  try {
    // await FirebaseAuth.instance.authStateChanges().first;
    print("✅ Auth connection successful");
  } catch (e) {
    print("❌ Auth connection failed: ${e.toString()}");
  }
}

void main() async {
  // Initialize binding first
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Add debug information
  if (kDebugMode) {
    print("🚀 Starting app in DEBUG mode");
    debugPrint("Widgets binding initialized");
  }

  try {
    // Load environment variables
    await dotenv.load(fileName: "assets/.env");
    print("🌍 Environment variables loaded");

    // Initialize localization
    await EasyLocalization.ensureInitialized();
    print("🌐 Localization initialized");

    // Initialize Firebase with error boundary
    await _initializeFirebaseWithRetry();
    print("🔥 Firebase services ready");

    runApp(
      EasyLocalization(
        supportedLocales: [Locale('en'), Locale('pt')],
        path: 'assets/translations',
        fallbackLocale: Locale('pt'),
        child: const MyApp(),
      ),
    );

    // Remove splash screen
    FlutterNativeSplash.remove();
  } catch (e, stackTrace) {
    print("💥 FATAL ERROR: $e");
    print("Stack trace: $stackTrace");
    // Consider showing an error screen here
  }
}

Future<void> _initializeFirebaseWithRetry() async {
  try {
    await initializeFirebase();
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      print("⚠️ Detected duplicate app, using existing instance");
      // Continue with existing instance
      final app = Firebase.app();
      print("🔥 Using existing Firebase app: ${app.name}");
    } else {
      rethrow;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlogBloc>(create: (context) => BlogBloc()),
        ChangeNotifierProvider<ItensBloc>(create: (context) => ItensBloc()),
        ChangeNotifierProvider<StateBloc>(create: (context) => StateBloc()),
        ChangeNotifierProvider<ExposicaoStateBloc>(
            create: (context) => ExposicaoStateBloc()),
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[900]),
          fontFamily: 'Manrope',
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey[900],
            ),
            titleTextStyle: TextStyle(
              color: Colors.grey[900],
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}

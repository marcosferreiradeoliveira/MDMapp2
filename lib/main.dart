import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/blog_bloc.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/blocs/state_bloc.dart';
import 'package:travel_hour/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash screen
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await dotenv.load(fileName: "assets/.env");
  await EasyLocalization.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("🔥 Firebase já inicializado ou erro: $e");
  }

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('pt')],
      path: 'assets/translations',
      fallbackLocale: Locale('pt'),
      child: MyApp(),
    ),
  );
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
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blueAccent,
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
        home: SplashScreen(),
      ),
    );
  }
}

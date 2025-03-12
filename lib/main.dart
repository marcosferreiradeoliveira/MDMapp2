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
import 'package:travel_hour/blocs/sp_state_one.dart';
import 'package:travel_hour/pages/home.dart';

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
      supportedLocales: [Locale('pt'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('pt'),
      startLocale: Locale('pt'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItensBloc>(
          create: (context) => ItensBloc(),
          lazy: false,
        ),
        ChangeNotifierProvider<BlogBloc>(
          create: (context) => BlogBloc(),
          lazy: false,
        ),
        ChangeNotifierProvider<ExposicaoStateBloc>(
          create: (context) => ExposicaoStateBloc(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_icons/flutter_icons.dart ';
// import 'package:travel_hour/blocs/notification_bloc.dart';
import 'package:travel_hour/pages/blogs.dart';
import 'package:travel_hour/pages/explore.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/pages/exposicoes.dart';
import 'package:travel_hour/services/app_service.dart';
import 'package:travel_hour/utils/snacbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/pages/sobre.dart';
import 'package:travel_hour/pages/ingresso.dart';
import 'package:travel_hour/pages/contato.dart';
import 'package:travel_hour/pages/programacao.dart';
// import '../blocs/ads_bloc.dart';
import '../services/notification_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.home, "title": "menu.home", "page": Explore()},
    {
      "icon": Icons.grid_view,
      "title": "menu.exhibitions",
      "page": ExposicoesPage()
    },
    {"icon": Icons.article, "title": "menu.news", "page": BlogPage()},
    {
      "icon": Icons.airplane_ticket,
      "title": "menu.tickets",
      "page": Ingressos()
    },
    {
      "icon": Icons.calendar_month_outlined,
      "title": "menu.schedule",
      "page": Programacao()
    },
    {"icon": Icons.album_outlined, "title": "menu.about", "page": Sobre()},
    {"icon": Icons.contact_mail, "title": "menu.contact", "page": Contato()},
  ];

  final languageSelector = {"icon": Icons.language, "title": "menu.language"};

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
    Navigator.pop(context); // Fecha o drawer após a navegação
  }

  // Future _initNotifications() async {
  //   try {
  //     if (!mounted) return;
  //     await NotificationService()
  //         .initFirebasePushNotification(context)
  //         .then((value) {
  //       if (mounted) {
  //         context.read<NotificationBloc>().checkPermission();
  //       }
  //     }).catchError((e) {
  //       debugPrint('Error initializing notifications: $e');
  //       // Continue com a execução mesmo se houver erro nas notificações
  //     });
  //   } catch (e) {
  //     debugPrint('Error in _initNotifications: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _initNotifications();
    AppService().checkInternet().then((hasInternet) {
      if (hasInternet != null && !hasInternet) {
        openSnacbar(context, 'no internet'.tr());
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("home.title").tr(),
          backgroundColor: Colors.grey,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.account_circle, size: 70, color: Colors.white),
                    // SizedBox(height: 10),
                    Text(
                      "home.menu".tr(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < menuItems.length; i++)
                ListTile(
                  leading: Icon(menuItems[i]["icon"]),
                  title: Text(menuItems[i]["title"]).tr(),
                  selected: _currentIndex == i,
                  onTap: () => onTabTapped(i),
                ),
              Divider(),
              ListTile(
                leading: Icon(languageSelector["icon"] as IconData),
                title: Text(context.locale.languageCode == 'en'
                    ? 'Português'
                    : 'English'),
                onTap: () async {
                  final currentLocale = context.locale.languageCode;
                  final newLocale = currentLocale == 'en' ? 'pt' : 'en';
                  await context.setLocale(Locale(newLocale));
                  if (mounted) {
                    setState(() {});
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: menuItems.map((item) => item["page"] as Widget).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_hour/blocs/notification_bloc.dart';
import 'package:travel_hour/pages/blogs.dart';
import 'package:travel_hour/pages/explore.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/pages/states.dart';
import 'package:travel_hour/services/app_service.dart';
import 'package:travel_hour/utils/snacbar.dart';
import 'package:easy_localization/easy_localization.dart';

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
    {"icon": Icons.home, "title": "Home", "page": Explore()},
    {"icon": Icons.grid_view, "title": "Exposições", "page": StatesPage()},
    {"icon": Icons.article, "title": "Novides", "page": BlogPage()},
    // {"icon": Icons.bookmark, "title": "Bookmarks", "page": BookmarkPage()},
    // {"icon": Icons.person, "title": "Profile", "page": ProfilePage()},
  ];

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
    Navigator.pop(context); // Fecha o drawer após a navegação
  }

  Future _initNotifications() async {
    await NotificationService()
        .initFirebasePushNotification(context)
        .then((value) => context.read<NotificationBloc>().checkPermission());
  }

  @override
  void initState() {
    super.initState();
    _initNotifications();
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
          title: Text("App Museu das Mulheres"),
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
                    Icon(Icons.account_circle, size: 70, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "Menu",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < menuItems.length; i++)
                ListTile(
                  leading: Icon(menuItems[i]["icon"]),
                  title: Text(menuItems[i]["title"]),
                  selected: _currentIndex == i,
                  onTap: () => onTabTapped(i),
                ),
              // Divider(),
              // ListTile(
              //   leading: Icon(Icons.exit_to_app),
              //   title: Text("Sair"),
              //   onTap: () {
              //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              //   },
              // ),
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

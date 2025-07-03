import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/config/config.dart';
import 'package:travel_hour/utils/toast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';

class AppService {
  Future<bool?> checkInternet() async {
    bool? internet;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        internet = true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      internet = false;
    }
    return internet;
  }

  Future openLink(context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      openToast1(context, "Can't launch the url");
    }
  }

  Future openEmailSupport(context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: Config().supportEmail,
      query: 'subject=About ${Config().appName}&body=',
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      openToast1(context, 'Something is wrong ! Please try again later');
    }
  }

  Future openLinkWithCustomTab(BuildContext context, String url) async {
    try {
      await FlutterWebBrowser.openWebPage(
        url: url,
        customTabsOptions: CustomTabsOptions(
          //addDefaultShareMenuItem: true,
          instantAppsEnabled: true,
          showTitle: true,
          urlBarHidingEnabled: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
          modalPresentationCapturesStatusBarAppearance: true,
        ),
      );
    } catch (e) {
      openToast1(context, 'Cant launch the url');
      debugPrint(e.toString());
    }
  }

  Future launchAppReview(context) async {
    // final SignInBloc sb = Provider.of<SignInBloc>(context, listen: false);
    String url;

    // if (Platform.isAndroid) {
    //   url = 'https://play.google.com/store/apps/details?id=${sb.packageName}';
    // } else if (Platform.isIOS) {
    //   if (Config().iOSAppId == '000000') {
    //     openToast1(
    //         context, 'The iOS version is not available on the AppStore yet');
    //     return;
    //   }
    //   url = 'https://apps.apple.com/app/id${Config().iOSAppId}';
    // } else {
    //   return;
    // }

    // final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // } else {
    //   openToast1(context, "Can't launch the app store");
    // }
  }

  static getNormalText(String text) {
    return HtmlUnescape().convert(parse(text).documentElement!.text);
  }
}

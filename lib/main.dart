import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flexi_finance/main/store/AppStore.dart';
import 'package:flexi_finance/main/utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'main/screens/op_splash_screen.dart';
import 'main/utils/AppConstant.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appStore.setDarkMode(await getBool(isDarkModeOnPref));

  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) =>
            Locale(appStore.selectedLanguage),
        locale: Locale(appStore.selectedLanguage),
        supportedLocales: [Locale('en', '')],
        routes: <String, WidgetBuilder>{
          /**launcher screen routes*/

          /**Dashboard screens routes*/

          /**Theme 1 screens routes*/

          /**QIBus screens routes*/

          /**Learner screens routes*/

          /**Social screens routes*/

          /**Online Quiz screens routes*/

          /**
           *Integration screens
           */

          /**Shophop screens routes*/

          /**Food App screens routes*/

          /**Grocery App screens routes*/

          /** Orapay App*/
          OPSplashScreen.tag: (BuildContext context) => OPSplashScreen(),
          /** Muvi app screens*/
        },
        title: mainAppName,
        home: OPSplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        builder: (context, child) =>
            ScrollConfiguration(behavior: SBehavior(), child: child),
      ),
    );
  }
}

class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

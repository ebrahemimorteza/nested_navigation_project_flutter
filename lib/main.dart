import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nashreasar/tools/rout.dart';
import 'package:nashreasar/tools/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // قفل کردن به حالت عمودی (پرتره)
    ]);
    //color to Status and navigate
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarColor: SolidColor.statusBar,
      // systemNavigationBarColor: Color(0xFFb6ebef),
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'drenglishapp',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // persian
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: Screens.root,
      routes: routes,
      // builder: (BuildContext context, Widget? child) {
      //   return FlutterEasyLoading(child: child);//loading
      // },
    );
  }
}


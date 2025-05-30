//create map for  rout
import 'package:flutter/cupertino.dart';
import 'package:nashreasar/tools/routes.dart';
import 'package:nashreasar/view/intro_screen/Splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes ={
  Screens.root :(context) => splashScreen(),
  // Screens.getLoginScreen :(context) => Login(changescreen: (val){}),
  // Screens.getPlacementScreen :(context) => Placement(),
  // Screens.getCartScreen :(context) => CartFull(changescreen: (val){},animateCart: (par){},),
  // Screens.main_screen :(context) => MainScreen(),
  // Screens.getOtpScreen :(context) => MainScreen(),
  // Screens.getRegisterScreen :(context) => Register(),
  // Screens.getLoginScreen :(context) => Login(),
  // Screens.getForgetScreen :(context) => Login(),
  // Screens.getOtpScreen :(context) => OtpCodeLoginScreen(),
};
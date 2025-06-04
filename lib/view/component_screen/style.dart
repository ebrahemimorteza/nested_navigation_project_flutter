import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/view/component_screen/size_screen.dart';
import 'package:nashreasar/view/component_screen/solidColor.dart';

class AppStyle {
  AppStyle._();//instance private to value static

  static TextStyle mainTextStyle = TextStyle(
    fontFamily: "Vazirmatn",
    fontSize: AppSize.multiminSizeText,
    fontWeight: FontWeight.normal,
    color: SolidColor.dr_appColor,
    textBaseline: TextBaseline.alphabetic
  );

  static TextStyle mainTextStyleTitle = TextStyle(
      fontFamily: "Vazirmatn",
      fontSize: AppSize.maxSizeText,
      fontWeight: FontWeight.normal,
      color: SolidColor.dr_appColor,
      textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleDel = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color:Colors.white,
      decoration: TextDecoration.lineThrough
  );
  static TextStyle mainTextStyleWhite = TextStyle(
      fontFamily: "Insanibc",
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color:Colors.white
  );
  static TextStyle mainTextStyleInvite = TextStyle(
    fontFamily: "Insanibc2",
    fontSize: 15,
    // fontWeight: FontWeight.w400,
      color:Colors.black.withOpacity(.5)
  );
  static TextStyle mainTextStyleInviteIntro = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 10,
      // fontWeight: FontWeight.w400,
      color:Colors.black.withOpacity(.5)
  );
  //TODO font body

  static TextStyle mainTextStyleContent = TextStyle(
    fontFamily: "Insanibc",
    fontSize: AppSize.midSizeText,
    fontWeight: FontWeight.w700,
    height: 2.1,
    color:Colors.white.withOpacity(0.9),
    decorationStyle: TextDecorationStyle.dotted
  );
  //TODO font title
  static TextStyle mainTextStyleContentTitle = TextStyle(
      fontFamily: "Insanibc",
      fontSize: AppSize.maxSizeText,
      fontWeight: FontWeight.w700,
      color:Colors.white.withOpacity(0.9),
      decorationStyle: TextDecorationStyle.dotted
  );
  static TextStyle mainTextStyleContentEng = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 9.0,
      fontWeight: FontWeight.w700,
      color:Colors.white.withOpacity(0.9),
      decorationStyle: TextDecorationStyle.dotted
  );



  static BoxDecoration mainDecorationStyle = BoxDecoration(
  color: Color.fromARGB(255, 227, 244, 254),borderRadius: BorderRadius.all(Radius.circular(5))
  );  
  static BoxDecoration slideDecorationStyle = BoxDecoration(
  color: Colors.white.withOpacity(.5),borderRadius: BorderRadius.all(Radius.circular(5))
  );



}
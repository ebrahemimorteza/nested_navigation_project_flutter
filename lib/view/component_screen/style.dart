import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/view/component_screen/size_screen.dart';
import 'package:nashreasar/view/component_screen/solidColor.dart';

class AppStyle {
  AppStyle._();//instance private to value static

  static TextStyle mainTextStyle = TextStyle(
    fontFamily: "Insanibc2",
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: SolidColor.dr_appColor,
    textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleIntro = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: SolidColor.dr_appColor,
      textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleIntroPrivacy = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: SolidColor.dr_appColor,
      textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleInput = TextStyle(
      fontFamily: "Insanibc",
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: SolidColor.dr_appColor,
      textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleEng = TextStyle(
      fontFamily: "Insanibc",
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: SolidColor.dr_appColor,
      textBaseline: TextBaseline.alphabetic
  );
  static TextStyle mainTextStyleBlack = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color:SolidColor.dr_navigateBar
  );
  static TextStyle mainTextStyleBlackBold = TextStyle(
      fontFamily: "Insanibc",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color:SolidColor.dr_navigateBar
  );
  static TextStyle hintTextTextStyle = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 13,
    color:SolidColor.dr_ColorhintText

  );

  static TextStyle mainTextminStyle = TextStyle(
    fontFamily: "Insanibc2",
    fontSize: 14,
      fontWeight: FontWeight.w500,
    color:SolidColor.dr_appColor
  );
  static TextStyle mainTextminStyleBold = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color:SolidColor.dr_appColor
  );
  static TextStyle mainTextProgress = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 14,
      fontWeight: FontWeight.w500,
    color:SolidColor.dr_appColorOrange
  );
  static TextStyle mainTextStyleNote = TextStyle(
    fontFamily: "Insanibc2",
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color:Colors.white
  );  static TextStyle titleTextStyle = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color:SolidColor.dr_appTitleColor
  );  static TextStyle trailingTextStyle = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color:SolidColor.dr_appColorValue
  );
  static TextStyle mainUnderTextStyle = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color:SolidColor.dr_appColor
  );
  static TextStyle mainTextStyleValue = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color:SolidColor.dr_appColorValue
  );
  static TextStyle mainTextStyleHeader = TextStyle(
    fontFamily: "Insanibc",
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color:Colors.white
  );
  static TextStyle mainTextStyleTitle = TextStyle(
      fontFamily: "Insanibc2",
      fontSize: 20,
      // fontWeight: FontWeight.w700,
      color:Colors.white,
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
      fontSize: 12,
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
  static BoxDecoration BottonDecorationStyle = BoxDecoration(boxShadow: [
    BoxShadow(
      color: SolidColor.dr_appColorShadow, // رنگ سایه
      offset: Offset(1.0, 1.0), // تنظیم آفست سایه
      blurRadius: 8.0, // شعاع انتشار سایه
      spreadRadius: 2.0, // شعاع گسترش سایه
    )]);
  static BoxDecoration BottonMain = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: SolidColor.dr_appColor,
      boxShadow: [
    BoxShadow(
      color: SolidColor.dr_appColorShadow, // رنگ سایه
      offset: Offset(1.0, 1.0), // تنظیم آفست سایه
      blurRadius: 8.0, // شعاع انتشار سایه
      spreadRadius: 2.0, // شعاع گسترش سایه
    )]);
  static BoxDecoration messageDecorationStyle = BoxDecoration(
      color: Color.fromARGB(255, 9, 34, 56),borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
      BoxShadow(
      color: SolidColor.dr_appColorShadow, // رنگ سایه
      offset: Offset(1.0, 1.0), // تنظیم آفست سایه
  blurRadius: 8.0, // شعاع انتشار سایه
  spreadRadius: 2.0, // شعاع گسترش سایه
  )]);

  static BoxDecoration messageNavigationStyle = BoxDecoration(
      color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
  static BoxDecoration backgroundDecoration = BoxDecoration(
    color: SolidColor.dr_ColorhintText
    // image: DecorationImage(
    //   image: Image(image: Assets.images.background.provider())
    //       .image,
    //   // Replace with your own image path
    //   fit: BoxFit.fill,
    // ),
  );
  static BoxDecoration backgroundDecorationContact = BoxDecoration(
      color: Color.fromARGB(255, 54, 255, 245),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static BoxDecoration textFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    // gradient: LinearGradient(
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    //   colors: [
    //     Colors.transparent,
    //     Color(0xFF52B9C0), // رنگ ترنسپرنت
    //   ],
    // ),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF52B9C0), // رنگ سایه
        offset: Offset(1.0, 1.0), // تنظیم آفست سایه
        blurRadius: 8.0, // شعاع انتشار سایه
        spreadRadius: 2.0, // شعاع گسترش سایه
      ),
    ],
  );
  static BoxDecoration boxFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.transparent,
        Color(0xFF52B9C0), // رنگ ترنسپرنت
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF52B9C0), // رنگ سایه
        offset: Offset(1.0, 1.0), // تنظیم آفست سایه
        blurRadius: 8.0, // شعاع انتشار سایه
        spreadRadius: 2.0, // شعاع گسترش سایه
      ),
    ],
  );
}
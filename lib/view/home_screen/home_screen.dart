import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';

import '../component_screen/line_screen.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? Key, required this.size, required this.animateCart}) : super(key: Key);
  final Function(int) animateCart;
  final Size size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.sizeOf(context);
    return Stack(
      children: [SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                HeaderScreen(),
                Padding(
                  padding: EdgeInsets.only(top: 18.0,right: size.width * 0.05),
                  child: Text(MyStrings.nashr_title,style: AppStyle.mainTextStyleTitle,),
                ),
                    LineScreen()
                  ]))),
        // CategoryList(animateCart: animateCart,),
      ],
    );
  }
}

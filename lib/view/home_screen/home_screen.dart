import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/view/cart_screen/cart_screen.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';
import 'package:nashreasar/view/home_screen/search_screen.dart';
import 'package:nashreasar/view/profile_screen/book_screen.dart';
import 'package:nashreasar/view/profile_screen/profile_screen.dart';

import '../component_screen/line_screen.dart';
import '../product_screen/category_screen.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? Key, required this.size, required this.animateCart, required this.param}) : super(key: Key);
  final Function(int) animateCart;
  final Size size;
  final int param;

  List<Widget> page = [CategoryList(),CartScreen(),BookScreen(),SearchScreen(),ProfileScreen()];
  List<String> title = [MyStrings.nashr_home,MyStrings.nashr_cart,MyStrings.nashr_book,MyStrings.nashr_search,MyStrings.nashr_profile];
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
                    Padding(
                      padding: EdgeInsets.only(top: 18.0,right: size.width * 0.05),
                      child: Text("${title[param]}",style: AppStyle.mainTextStyleTitle,),
                    ),
                    LineScreen()
                  ]))),
        page[param],
      ],
    );
  }
}

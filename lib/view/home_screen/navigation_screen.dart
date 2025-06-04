import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../component_screen/solidColor.dart';

class NavigationButton extends StatefulWidget {
  NavigationButton({
    Key? Key,
    required this.changescreen,
    required this.selectedButtonHome,
    required this.selectedButtonCart,
    required this.selectedButtonBookMe,
    required this.selectedButtonSearch,
    required this.selectedButtonProfile,

  }) : super(key: Key);
  int selectedButtonHome = 1;
  int selectedButtonProfile = 0;
  int selectedButtonCart = 0;
  int selectedButtonBookMe = 0;
  int selectedButtonSearch = 0;
  final Function(int) changescreen;
  final focusNode = FocusNode();
  var box = GetStorage();

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      //ios
      // bottom: 40,
      child: Column(
        children: [
          Stack(
            children: [
            Container(
              // height: 200,
              height: size.height / 12,
              decoration: const BoxDecoration(
                color: Colors.white,
                // gradient: LinearGradient(
                //
                //   // colors: GradientColors.bottomNavBackground,
                //   // begin: Alignment.topCenter,
                //   // end: Alignment.bottomCenter,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ZoomTapAnimation(
                      child: IndexedStack(
                          index: widget.selectedButtonHome,
                          // key: key,
                          children: [
                            TextButton(
                              onPressed: () => {
                                widget.changescreen(0),
                              },
                              child:icon(Icons.home_outlined,MyStrings.nashr_home,SolidColor.dr_appBlack2,size),
                              // iconSize: 35,
                            ),
                            TextButton(
                              onPressed: () => {},
                              child:
                              icon(Icons.home_filled,MyStrings.nashr_home,SolidColor.deepNavy,size)
                            )
                          ]),
                    ),

                    ZoomTapAnimation(
                      child: IndexedStack(
                          index: widget.selectedButtonCart,
                          // key: key,
                          children: [
                            TextButton(
                              onPressed: () => {
                                widget.changescreen(1),
                              },
                              child:icon(Icons.shopping_cart_outlined,MyStrings.nashr_cart,SolidColor.dr_appBlack2,size),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                icon(Icons.shopping_cart,MyStrings.nashr_cart,SolidColor.deepNavy,size),
                            )
                          ]),
                    ),
                    ZoomTapAnimation(
                      child: IndexedStack(
                          index: widget.selectedButtonBookMe,
                          // key: key,
                          children: [
                            TextButton(
                              onPressed: () => {
                                widget.changescreen(2),
                              },
                              child:icon(Icons.local_library_outlined,MyStrings.nashr_book,SolidColor.dr_appBlack2,size),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                icon(Icons.local_library,MyStrings.nashr_book,SolidColor.deepNavy,size),
                            )
                          ]),
                    ),
                    ZoomTapAnimation(
                      child: IndexedStack(
                          index: widget.selectedButtonSearch,
                          // key: key,
                          children: [
                            TextButton(
                              onPressed: () => {
                                widget.changescreen(3),
                              },
                              child:icon(Icons.search,MyStrings.nashr_search,SolidColor.dr_appBlack2,size),

                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                icon(Icons.search,MyStrings.nashr_search,SolidColor.deepNavy,size),
                            )
                          ]),
                    ),
                    ZoomTapAnimation(
                      child: IndexedStack(
                          index: widget.selectedButtonProfile,
                          // key: key,
                          children: [
                            TextButton(
                              onPressed: () => {
                                widget.changescreen(4),
                              },
                              child:icon(Icons.person_outline_outlined,MyStrings.nashr_profile,SolidColor.dr_appBlack2,size),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                icon(Icons.person_rounded,MyStrings.nashr_profile,SolidColor.deepNavy,size)
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],)
        ],
      ),
    );
  }
  Widget icon(IconData icon, String text, Color color,size) {
    return SizedBox(
      width: size.width*0.135, // عرض ثابت برای اطمینان از وسط‌چین شدن
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ایکون در وسط
          Container(
            child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Icon(icon, size: 30, color: color),
              ),
            ),
          ),
          // متن در زیر ایکون و وسط‌چین
          Positioned(
            top: 30, // فاصله از ایکون
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: AppStyle.mainTextStyle.copyWith(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../component_screen/solidColor.dart';

class NavigationButton extends StatefulWidget {
  NavigationButton({
    Key? Key,
    required this.changescreen,
    required this.selectedButtonHome,
    required this.selectedButtonProfile,
    required this.selectedButtonCart,
    required this.selectedButtonBookMe,
    required this.selectedButtonSearch,

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
      bottom: 1,
      //ios
      // bottom: 40,
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.bottomNavBackground,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: Icon(Icons.home_outlined,size: 30.0,color: SolidColor.dr_appBlack1,),
                              // iconSize: 35,
                            ),
                            TextButton(
                              onPressed: () => {},
                              child:
                              Icon(Icons.home,size: 30.0,color: SolidColor.dr_appButton)
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
                                widget.changescreen(1),
                              },
                              child: Icon(Icons.person_outline_outlined,size: 30.0,color: SolidColor.dr_appBlack1,),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                Icon(Icons.person_rounded,size: 30.0,color: SolidColor.dr_appButton,)
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
                                widget.changescreen(2),
                              },
                              child: Icon(Icons.shopping_cart_outlined,size: 30.0,color: SolidColor.dr_appBlack1,),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                Icon(Icons.shopping_cart,size: 30.0,color: SolidColor.dr_appButton,)
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
                                widget.changescreen(3),
                              },
                              child: Icon(Icons.local_library_outlined,size: 30.0,color: SolidColor.dr_appBlack1,),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                Icon(Icons.local_library,size: 30.0,color: SolidColor.dr_appButton,)
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
                                widget.changescreen(4),
                              },
                              child: Icon(Icons.search,size: 30.0,color: SolidColor.dr_appBlack1,),
                              // iconSize: 35,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child:
                                Icon(Icons.search,size: 30.0,color: SolidColor.dr_appButton,)
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
}

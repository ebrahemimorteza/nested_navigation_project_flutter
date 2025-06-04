import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../component_screen/solidColor.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      // height: 200,
      height: size.height / 9,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: GradientColors.bottomNavBackground,
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(right: size.width * 0.05),
              child: Image(image: Assets.images.nashr.provider()),
            ),
           Padding(
             padding: EdgeInsets.only(left: size.width * 0.05),
             child: ZoomTapAnimation(
                 child: TextButton(
                     onPressed : (){
                       print("duhfudhfu");
                     },
                     child: Icon(Icons.arrow_forward_ios,color: Colors.white,))),
           )
          ],
        ),
      ),
    );
  }
}

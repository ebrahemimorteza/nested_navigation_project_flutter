import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nashreasar/view/component_screen/solidColor.dart';

class Loading{
 dynamic showloading(context){
    return SpinKitThreeBounce(
      size: 40.0,
      itemBuilder: (context,int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: SolidColor.dr_appColor,
               shape: BoxShape.circle
          ),
        );
      },
    );
  }
  dynamic showLoadingBox(context,x,y){
   return ClipRRect(
     borderRadius: BorderRadius.circular(30),
     child: BackdropFilter(
       filter: ImageFilter.blur(sigmaX: y, sigmaY: y),
       child: Container(
         height: 300,
         width: 300,
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [
               Colors.white.withOpacity(0.1),
               Colors.white.withOpacity(0.05),
             ],
           ),
           borderRadius: BorderRadius.circular(30),
           border: Border.all(
             width: 1.5,
             color: Colors.white.withOpacity(0.2),
           ),
           boxShadow: [
             BoxShadow(
               color: Colors.white.withOpacity(0.1),
               spreadRadius: 5,
               blurRadius: 7,
               offset: Offset(0, 3),
             ),
           ],
         ),
         child: Padding(
           padding: EdgeInsets.all(0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               SizedBox(height: 10),
               Text(
                 'please wait',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 12,
                   fontWeight: FontWeight.bold,
                   shadows: [
                     Shadow(
                       blurRadius: 10,
                       color: Colors.pinkAccent,
                       offset: Offset(5, 5),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }
}
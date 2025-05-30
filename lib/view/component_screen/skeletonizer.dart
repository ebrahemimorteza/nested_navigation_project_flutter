import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:skeletons/skeletons.dart';

class Skeletonizer extends StatelessWidget {
  double width;
  double height;
  Skeletonizer({required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height,
      child: Text(''),
    );
  }
}
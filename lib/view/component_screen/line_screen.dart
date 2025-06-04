import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineScreen extends StatelessWidget {
  const LineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding:  EdgeInsets.only(top: 18.0,right: size.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white
        ),
        height: 5, // ارتفاع خط
        width: 50, // تمام عرض صفحه یا مقدار مشخص
        // color: Colors.grey, // رنگ خط
      ),
    );
  }
}

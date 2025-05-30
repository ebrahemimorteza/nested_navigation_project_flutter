import 'package:flutter/material.dart';

class SnakeScreen{
  static void showCustomSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 20, // تغییر این مقدار برای قرار دادن در بالای صفحه
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent, // پس‌زمینه شفاف
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
              BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
              ],
            ),
            child: Text(
              message,
              style: TextStyle(
                fontFamily: "Insanibc",
                fontSize: 13,
                color: Color.fromARGB(255, 114, 116, 225),
              ),
              textAlign: TextAlign.center, // متن در وسط قرار بگیرد
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // حذف بعد از مدت زمان مشخص
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
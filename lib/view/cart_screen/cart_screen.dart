import 'package:flutter/cupertino.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/line_screen.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>> cart");
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: size.height*0.3),
      child: Container(
          decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.all(Radius.circular(30.0))
          )
      ),
    );
  }
}

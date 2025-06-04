import 'package:flutter/cupertino.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/line_screen.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>> book");
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

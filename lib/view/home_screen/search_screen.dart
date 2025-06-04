import 'package:flutter/cupertino.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/line_screen.dart';
import 'package:nashreasar/view/component_screen/style.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>> search");
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/style.dart';

class Connection extends StatelessWidget {
  const Connection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(children: [
        // Image(image: Assets.images.said.provider()),
        Text(MyStrings.dr_warning_disconect,style: AppStyle.mainTextStyleInput,),
      ],),),
    );
  }
}

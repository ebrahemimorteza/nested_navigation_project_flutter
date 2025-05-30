import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nashreasar/view/component_screen/solidColor.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return Container(
        decoration: BoxDecoration(
          color: SolidColor.dr_ColorMain
        ),
      );
}
}

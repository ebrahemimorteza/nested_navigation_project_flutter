
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/view/component_screen/size_screen.dart';
import 'package:nashreasar/view/component_screen/storage_screen.dart';
import 'package:nashreasar/view/component_screen/style.dart';
// import 'package:get_storage/get_storage.dart';

class ButtonScreen extends StatefulWidget {
  ButtonScreen({super.key,required this.title,required this.icon,required this.width,required this.height,required this.isPost});
  String ? title;
  final icon;
  double width;
  double height;
  bool isPost;
  @override
  _ButtonScreen createState() => _ButtonScreen();
}

class _ButtonScreen extends State<ButtonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final focusNode = FocusNode();
  var box = GetStorage();

  @override
  void initState() {
    super.initState();
   _initlized();
  }
  void _initlized(){
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end:widget.isPost ?  1.1 : 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeScreenMain = box.read(sizeScreen);
    var size = MediaQuery.sizeOf(context);
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: child,
          );
        },
        child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                // image: widget.icon.provider(),width:sizeScreenMain < AppSize.dr_size_tablet ? size.width*.6 : size.width/8.20,
                image: widget.icon.provider(),
                // width: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(widget.title!,style: AppStyle.mainTextStyleWhite.copyWith(fontSize: AppSize.maxSizeButton,fontWeight: FontWeight.w400 ),),
              )
            ]
        ),
      ),
    );
  }
}
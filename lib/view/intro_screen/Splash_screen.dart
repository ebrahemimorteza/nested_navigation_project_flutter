import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/view/component_screen/storage_screen.dart';
import 'package:nashreasar/view/home_screen/main_screen.dart';



class splashScreen extends StatefulWidget{
State<splashScreen> createState() => _SpashScreenState();

  
}
class _SpashScreenState extends State<splashScreen>{
  var box = GetStorage();
  double valueSizeScreen = 0.0;
  String _link = '';
  String _id = '';

  @override
  void initState(){
    super.initState();
  }
  // دریافت دیپ لینک
  Future<void> initAppLinks(context) async {
    final appLinks = AppLinks();
    // دریافت لینک اولیه (اگر اپلیکیشن با دیپ لینک باز شده باشد)
    final initialLink = await appLinks.getInitialLink();
    if (initialLink != null) {
      // استخراج آیدی از لینک
      final uri = Uri.parse(initialLink.toString());
      final id = uri.queryParameters['id']; // دریافت آیدی از لینک
      // اگر لینک وجود داشت، کاربر را به صفحه تست هدایت کنید
      Future.delayed(Duration(seconds: 3)).then((value){
        box.write(sizeScreen, valueSizeScreen);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>box.read(token) == null  ? MainScreen() : MainScreen()));
        // Navigator.of(globalContext).pushReplacement(MaterialPageRoute(builder: (context)=>box.read(language) == null ? OnBoardingPage() : MainScreen(rout: 0,)));
      });
    } else {
      // اگر لینک وجود نداشت، کاربر را به صفحه اسپلش هدایت کنید
      routing(context);
    }

    // گوش دادن به تغییرات لینک (اگر اپلیکیشن در حال اجرا باشد)
    appLinks.uriLinkStream.listen((Uri uri) {
      // اگر لینک تغییر کرد، کاربر را به صفحه تست هدایت کنید
      Navigator.pushReplacementNamed(context, '/test');
    });
  }
  void routing(context){
    Future.delayed(Duration(seconds: 3)).then((value){
      box.write(sizeScreen, valueSizeScreen);
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainScreen(rout: 0,)));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>box.read(token) == null ? MainScreen() : MainScreen()));
    });
  }
  void routingWithPage(context){
    print("valueSizeScreen >>>>>>>>>>>>>>$valueSizeScreen<<<<<<<<<<<< valueSizeScreen");
    Future.delayed(Duration(seconds: 1)).then((value){
      box.write(sizeScreen, valueSizeScreen);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainScreen()));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>box.read(language) == null ? IntroScreenDefaultState(sizeScreen: valueSizeScreen,) : MainScreen(sizeScreen: valueSizeScreen,)));
    });
  }
  static bool _isRootLogin = false;
  static bool _isRootProfile = false;
  static bool _isRootPlacement = false;
  static bool _isRootCart = false;
  static var globalContext;
  static var size;
  Future<String?> getUrlWeb() async{
    // خواندن URL فعلی مرورگر
    Uri currentUri = Uri.base;
    debugPrint('<><><><><><><><><><><><><>');
    debugPrint('$currentUri');
    debugPrint('<><><><><><><><><><><><><>');
      String? type = currentUri.queryParameters['type'];
    // بررسی URL ساده
      var tok = box.read(token);
    if (type == 'loginApplication') {
      if(tok==null){
      _isRootLogin = true;
      }else{
        _isRootProfile = true;
      }
    } // بررسی URL ساده
    else if (type ==  'placement') {
      _isRootPlacement = true;
    }else {
      String? id = currentUri.queryParameters['id'];
      String? lang = currentUri.queryParameters['lang'];
      if(id!=null){
        _isRootCart = true;

      }
    }


  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     // getUrlWeb();
     globalContext=context;
      size = MediaQuery.sizeOf(context);
    // TODO: implement build
      return SafeArea(
        child: Scaffold(
            body: LayoutBuilder(
            builder: (context, constraints) {
              if(_isRootPlacement || _isRootLogin || _isRootCart){
                valueSizeScreen = constraints.maxWidth;
                routingWithPage(context);
               return Text('welcome');
              }
              initAppLinks(context);
              if (constraints.maxWidth < 900) {
                valueSizeScreen = constraints.maxWidth;
                // Mobile layout
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/screen.png'),
                      // Replace with your own image path
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                valueSizeScreen = constraints.maxWidth;
                // Tablet and browser layout
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/desk_spalsh.png'),
                      // Replace with your own image path
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
  }
}
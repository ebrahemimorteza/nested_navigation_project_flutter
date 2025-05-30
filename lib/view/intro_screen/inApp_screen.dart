// import 'dart:async';
//
// // import 'package:englishapp/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:flutter_tts/flutter_tts.dart';
// // import 'package:flutter_tts/flutter_tts.dart';
//
// class Browser extends StatefulWidget {
//   late String url;
//   late String type;
//   final Function()? status;
//   Browser({required this.url, required this.type, this.status});
//
//   @override
//   State<Browser> createState() => _BrowserState();
// }
//
// class _BrowserState extends State<Browser>  with SingleTickerProviderStateMixin{
//   double _progress=0;
//   late InAppWebViewController inAppController;
//   InAppWebViewController? inAppWebViewController;
//   late AnimationController _controllerAnim;
//   late Animation<Offset> _slideAnimation;
//   bool _shouldLoadPage = true;
//   FlutterTts flutterTts = FlutterTts();
//   // TtsState ttsState = TtsState.stopped;
//   Future initTts() async {
//     await flutterTts.setLanguage('en-US'); // تنظیم زبان به انگلیسی
//     await flutterTts.setSpeechRate(0.5); // تنظیم سرعت گفتار
//     await flutterTts.setVolume(1.0); // تنظیم میزان صدا
//     await flutterTts.setPitch(1.0); // تنظیم تنظیم نرخ گفتار
//   }
//   Future initAnimition() async {
//     _controllerAnim = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0.0, 1.0), // شروع از پایین
//       end: Offset(0.0, 0.0),   // پایان در مرکز
//     ).animate(CurvedAnimation(
//       parent: _controllerAnim,
//       curve: Curves.easeInOut,
//     ));
//     _controllerAnim.forward();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//     // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   }
//   @override
//   void initState() {
//     super.initState();
//     initAnimition();
//
//   }
//   void speakText(String text) async {
//     print('*****speac${text}');
//     initTts();
//     await flutterTts.speak(text);
//   }
//
//   void stopSpeaking() async {
//     await flutterTts.stop();
//   }
//
//
//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     widget.url;
//     widget.type;
//     inAppController.removeAllUserScripts();
//     _controllerAnim.dispose();
//     // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     super.dispose();
//   }
//   bool isIconVisible = false;
//
//   void _onIconTap() {
//     setState(() {
//       isIconVisible = true;
//     });
//
//     Timer(Duration(seconds: 2), () {
//       setState(() {
//         isIconVisible = false;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     print(",,,,,,,,,   > ${widget.url}");
//     SystemChrome.setPreferredOrientations([
//       widget.type=='game' ? DeviceOrientation.landscapeLeft: DeviceOrientation.portraitUp , // قفل کردن به حالت عمودی (پرتره)
//     ]);
//     return WillPopScope(
//       onWillPop: () async {
//         // SystemChrome.setPreferredOrientations([
//         //   DeviceOrientation.portraitUp , // قفل کردن به حالت عمودی (پرتره)
//         // ]);
//         Navigator.of(context).pop(true);
//         // کدی که می‌خواهید اجرا شود وقتی کاربر دکمه برگشت را فشار می‌دهد
//         // به عنوان مثال، می‌توانید یک پیام تأیید خروج نمایش دهید
//         // showDialog(
//         //   context: context,
//         //   builder: (BuildContext context) {
//         //     return AlertDialog(
//         //       title: Text('خروج'),
//         //       content: Text('آیا می‌خواهید از برنامه خارج شوید؟'),
//         //       actions: <Widget>[
//         //         ElevatedButton(
//         //           onPressed: () => Navigator.of(context).pop(false),
//         //           child: Text('خیر'),
//         //         ),
//         //         ElevatedButton(
//         //           onPressed: () => Navigator.of(context).pop(true),
//         //           child: Text('بله'),
//         //         ),
//         //       ],
//         //     );
//         //   },
//         // );
//         // اگر می‌خواهید که بک زدن ممنوع شود، باید true برگردانید
//         // در غیر این صورت، false برگردانید
//         return false;
//       },
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: [
//
//               GestureDetector(
//                 onTap:  _onIconTap,
//                 child: InAppWebView(
//                   initialUrlRequest: URLRequest(
//                     // url: Uri.parse(widget.url), // آدرس صفحه وب مورد نظر خود را قرار دهید
//                     url: WebUri('${Uri.parse(widget.url)}'), // آدرس صفحه وب مورد نظر خود را قرار دهید
//                   ),
//                   initialOptions: InAppWebViewGroupOptions(
//                     crossPlatform: InAppWebViewOptions(
//                       // transparentBackground: true, // تنظیم بک‌گراند شفاف
//                     ),
//                   ),
//                   onWebViewCreated: (InAppWebViewController controller) {
//                     inAppController=controller;
//                     inAppController.addJavaScriptHandler(
//                       handlerName: 'speakText2',
//                       callback: (args) {
//                         String text = args[0];
//                         print("tttttttttttttttt$text");
//                         if(text=="closeApp"){
//                           _controllerAnim.reverse();
//                           Navigator.of(context).pop();
//                         }else{
//                           speakText(text);
//                         }
//                         // عملیات دلخواه با مقدار تکست
//                         // تابع مورد نظر خود را در اپ Flutter اجرا کنید
//                         print('JavaScript Function Executed: speakText2');
//                         print(args);
//                       },
//                     );
//                   },
//                   onLoadStop: (InAppWebViewController controller, Uri? url) {
//                     inAppController=controller;
//                     // تزریق کد جاوااسکریپت به صفحه وب
//                     String yourJavaScriptCode = '''
//                 // تعریف تابع clickCallback
//                 function clickCallback(text) {
//                   window.flutter_inappwebview.callHandler('speakText2', text);
//                 }
//
//                 // اضافه کردن رویداد کلیک به صفحه وب
//                 // document.addEventListener('click', clickCallback);
//                 function speakText(text) {
//             clickCallback(text);
//                 }
//
//               ''';
//                     controller.evaluateJavascript(source: yourJavaScriptCode);
//                   },
//                 ),
//               ),
//               widget.type!='game' ? Align(
//                 alignment: Alignment.topRight,
//                 child: AnimatedOpacity(
//                   duration: Duration(milliseconds: 500),
//                   opacity: isIconVisible ? 1.0 : 1.0,
//                   child: Container(
//                     width: 70,
//                     padding: EdgeInsets.all(10),
//                     color: Colors.black.withOpacity(0.009),
//                     child: InkWell(
//                       onTap: () {
//                         _controllerAnim.reverse();
//                         inAppController.clearCache();
//                         widget.type=='payment' ? widget.status : '';
//                         Navigator.of(context).pop();
//                         // SystemChrome.setPreferredOrientations([
//                         //   DeviceOrientation.portraitUp , // قفل کردن به حالت عمودی (پرتره)
//                         // ]);
//                       },
//                       child: Image(image: Assets.images.close.provider(),),
//                     ),
//                   ),
//                 ),
//               ):Text(''),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
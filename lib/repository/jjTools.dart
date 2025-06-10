import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

final dio = Dio();
Map<String, String> headers = {};

class JJ {
  static const String server = "http://192.168.213.14:8080/NashrAsr/";
  static const String serversocket = "ws://192.168.213.14:8080/NashrAsr";
  // static const String serversocket = "ws://192.168.21.14:8080/LAS/";
  // static const String server = "http://192.168.21.14:8080/LAS/";
  // static const String serversocket = "ws://188.136.136.71:8085/LASApp/";
  // static const String server = "http://188.136.136.71:8085/LASApp/";
  static const String serverController = "${server}Server?";
  static const String serverUpload = "https://192.168.213.14/LASS/";
  // static const String serverUpload = "https://192.168.0.193:8080/LAS/upload2/";


  static bool showloader = false;
  static String user_token = "";
  static String user_username = "";
  static String user_codeMeli = "";
  static String user_birthdate = "";
  static String user_attachPicPersonnelCard = "";
  static String user_id = "";
  static String user_name = "";
  static String user_family = "";
  static String user_mobile = "";
  static String user_postalCode = "";
  static String user_AccountInformation = "";
  static String user_address = "";
  static String user_city = "تهران";
  static String user_grade = "";
  static String user_email = "";
  static var publicConfigs = {};
  static String userBalance = "";//Fill from Payment.java in main.dart

  static SharedPreferences? localStorage ;

  // flutter build apk --target-platform=android-arm
  // flutter build apk --target-platform=android-arm64



  /// This function send simple get request to server and return response as String
  Future<String> jjAjax(String params) async {
    try {
      // final cookieJar = CookieJar();
      // dio.interceptors.add(CookieManager(cookieJar));
      // showloader=true;//Before send http request
      final response =
          await dio.get('${serverController}&$params');
      showloader=false;//after send http request
     debugPrint('jjAjax-response.statusCode:${response.statusCode}');
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return (response.data);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        jjToast('خطا در اتصال به سرور');
        return '';
      }
    } catch (e) {
      jjToast('خطا در اتصال به شبکه');
      return '400';
    }
    //debugPrint(await http.read(Uri.parse('http://95.217.123.171:8080/Server')));
  }
//this function send file to local storage divice
//   Future<String> writeAndReadFile(url,nameFile) async {
//
//
//     final directory = await getExternalStorageDirectory();
//     // final directory = await getApplicationDocumentsDirectory();
//     String newPath = '${directory!.path}/dr_english';
//     Directory(newPath).createSync(recursive: true);
//     final filePath = '${newPath}/${nameFile}';
//     print(filePath);
//     final file = File(filePath);
//     // if (await file.exists()) {
//     //   // فایل وجود دارد، بنابراین محتوای فایل را بخوانید و نشان دهید
//     //   final fileContent = await file.readAsBytes();
//       final response = await http.get(Uri.parse(url));
//       // فایل وجود ندارد، بنابراین محتوای جدید را به فایل بنویسید
//       file.writeAsBytes(response.bodyBytes);
//       final fileContent = await file.readAsBytes();
//     print("1111111111111111111111111111111111111111 >>?>>>> file");
//       return '';
//       print('فایل جدید با محتوای "$response.bodyBytes" ایجاد شد.');
//
//     // await file.writeAsBytes(response.bodyBytes);
//     print("1111111111111111111111111111111111111111 >>>>> file success");
//   }
  Future<void> writeAndReadFile(String videoUrl, String separatedPart) async {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(videoUrl));
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    final directory = await getExternalStorageDirectory();
    String newPath = '${directory!.path}/dr_english';
    Directory(newPath).createSync(recursive: true);
    final filePath = '$newPath/$separatedPart';
    final file = File(filePath);
    await file.writeAsBytes(bytes);
  }

  Future<String> readResponse(HttpClientResponse response) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  static Future<String> fileUpload(File imageFile) async {
    try {
      var stream = http.ByteStream(imageFile.openRead());
      stream.cast();
      var length = await imageFile.length();
      var uri = Uri.parse("${JJ.server}UploadServlet");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile('file', stream, length,
          filename: basename(imageFile.path));
      //contentType: new MediaType('image', 'png'));
      request.files.add(multipartFile);
      final response = await request.send();
     debugPrint(response.reasonPhrase);

      if (response.statusCode == 200) {
        final contents = StringBuffer();
        await for (var data in response.stream.transform(utf8.decoder)) {
          contents.write(data);
          return contents.toString();
        }
      }
      jjToast('خطای بارگزاری در برنامه کد 78');
      return '';
    } catch (e) {
      jjToast('خطا در اتصال به شبکه کد 81');
      return '';
    }
  }

  //This Function returns a list that which using for create dropdown menu
  static List<String> getListFromJson(List<dynamic> json, String atrName) {
    List<String> l = [];
    for (int i = 0; i < json.length; i++) {
      l.add(json[i][atrName]);
    }
    return l;
  }

  static void jjToast(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 5,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //       backgroundColor: Colors.black87
  //   );
  }


  ///تبدیل تاریخ از متن به تاریخ شمسی
  static DateTime toDateTime(String timeStampStr) {
      var inputStr = timeStampStr.replaceAll("/", "-");
      var splitedStr = inputStr.split("-");
      if (splitedStr[2].length == 1) {
        splitedStr[2] = "0" + splitedStr[2];
      }
      if (splitedStr[1].length == 1) {
        splitedStr[1] = "0" + splitedStr[1];
      }
      return DateTime.parse(splitedStr.join("-"));

  }

}

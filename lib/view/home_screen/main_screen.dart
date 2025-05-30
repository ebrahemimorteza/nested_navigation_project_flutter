import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
class NavigationIndex {
  NavigationIndex._();
  static const home = 0;
  static const profile = 1;
  static const Cart = 4;
  static const BookMee = 3;
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //گلوبال های نگه داری صفحات
  var selectedPageIndex = NavigationIndex.home;
  var selectedButtonHome = 1;
  var selectedButtonProfile = 0;
  var selectedButtonCart = 0;
  var selectedButtonBookMe = 0;

  var box = GetStorage();
  var globalContext;
  bool isFullCart=false;
  bool _isPost=false;//برای اینکه بتوانمی کاربر را در صورت درست بودن از صفحه لاگین به ثبت نام ببریم
  List<int> _listHistory = [NavigationIndex.home];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _bookKey = GlobalKey();

  int selectedIndex = NavigationIndex.home;
  Future<bool> _onWillPop() async {
    // if (map[selectedPageIndex]!.currentState!.canPop()) {
    //   print(">>>>>> Darad");
    //   map[selectedPageIndex]!.currentState!.pop();
    // } else if (_listHistory.length > 1) {
    //   print(">>>>>> NaDarad");
    //   setState(() {
    //     _listHistory.removeLast(); //delete last value
    //     selectedPageIndex = _listHistory.last;
    //   });
    //   paging(selectedPageIndex);
    // }else{
    //   SystemNavigator.pop();
    // }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<Repository>(
        //   create: (context) => Repository(),
        // ),
      ],
      child: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: Stack(children: [
              Positioned.fill(
                  child: IndexedStack(children: [
                    Navigator(
                      key:_homeKey,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Text("data")),
                    )
                  ]
                    ,))
            ]),
          ),
        ),
      ),
    );
  }
  //اجرای بک گوشی
  bottomNavigationOnPresst({required index}) {
    setState(() {
      selectedPageIndex = index;
      _listHistory.add(selectedPageIndex);
    });
  }
}

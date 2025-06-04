import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/repository/repository_screen.dart';
import 'package:nashreasar/view/home_screen/background_screen.dart';
import 'package:nashreasar/view/home_screen/header_screen.dart';
import 'package:nashreasar/view/home_screen/home_screen.dart';
import 'package:nashreasar/view/home_screen/navigation_screen.dart';
class NavigationIndex {
  NavigationIndex._();
  static const home = 0;
  static const profile = 1;
  static const cart = 2;
  static const bookMee = 3;
  static const search = 4;
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var box = GetStorage();
  var globalContext;
  bool isFullCart=false;
  //گلوبال های نگه داری صفحات
  var selectedPageIndex = NavigationIndex.home;
  var selectedButtonHome = 1;
  var selectedButtonProfile = 0;
  var selectedButtonCart = 0;
  var selectedButtonBookMe = 0;
  var selectedButtonSearch = 0;
  List<int> _listHistory = [NavigationIndex.home];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _bookKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();

  //create map for connect index and key
  late final map = {
    NavigationIndex.home: _homeKey,
    NavigationIndex.profile: _profileKey,
    NavigationIndex.cart: _cartKey,
    NavigationIndex.bookMee: _bookKey,
    NavigationIndex.search: _searchKey,

  };
  int selectedIndex = NavigationIndex.home;
  Future<bool> _onWillPop() async {
    if (map[selectedPageIndex]!.currentState!.canPop()) {
      print(">>>>>> Darad");
      map[selectedPageIndex]!.currentState!.pop();
    } else if (_listHistory.length > 1) {
      print(">>>>>> NaDarad");
      setState(() {
        _listHistory.removeLast(); //delete last value
        selectedPageIndex = _listHistory.last;
      });
      // paging(selectedPageIndex);
    }else{
      // SystemNavigator.pop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Repository>(
          create: (context) => Repository(),
        ),
      ],  
      child: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: Stack(children: [
              Background(),
              Positioned.fill(
                  child: IndexedStack(
                    index: selectedPageIndex,
                    children: [
                    Navigator(
                      key:_homeKey,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Homescreen(size: size, animateCart: (val){})),
                    ),
                    Navigator(key:_profileKey ,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Text("data2")),),
                    Navigator(key:_cartKey ,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Text("data3")),),
                    Navigator(key:_bookKey ,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Text("data4")),),
                    Navigator(key:_searchKey ,
                      onGenerateRoute: (sitting) =>
                          MaterialPageRoute(builder: (context) => Text("data5")),),
                  ]
                    ,)),
              NavigationButton(
                changescreen: (int value) {
                  print("selectedPageIndex $value");
                  setState(() {
                    selectedPageIndex = value;
                    bottomNavigationOnPresst(index: value);
                    selectedPageIndex == 0
                        ? selectedButtonHome = 1
                        : selectedButtonHome = 0;
                    selectedPageIndex == 1
                        ? selectedButtonProfile = 1
                        : selectedButtonProfile = 0;
                    selectedPageIndex == 2
                        ? selectedButtonCart = 1
                        : selectedButtonCart = 0;
                    selectedPageIndex == 3
                        ? selectedButtonBookMe = 1
                        : selectedButtonBookMe = 0;
                    selectedPageIndex == 4
                        ? selectedButtonSearch = 1
                        : selectedButtonSearch = 0;
                  });
                },
                selectedButtonHome: selectedButtonHome,
                selectedButtonProfile: selectedButtonProfile,
                selectedButtonCart: selectedButtonCart,
                selectedButtonBookMe: selectedButtonBookMe,
                selectedButtonSearch: selectedButtonSearch,
              )
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

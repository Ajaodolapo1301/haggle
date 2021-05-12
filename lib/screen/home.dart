import 'dart:async';

import 'package:flutter/material.dart';


import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/screen/Homepage.dart';
import 'package:haggle/utils/sizeConfig/dev_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with WidgetsBindingObserver {
  int currentIndex = 0;
  PageController pageController = PageController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // AccountState accountState;
  Timer _timer;
  // AppState appState;
  double textScale = 1.0;
  void initTextScale() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      textScale = pref.getDouble("textScaleFactor") ?? 1.0;
    });
  }
  bool selected = false;
  @override
  void initState() {
    initTextScale();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    // appState = Provider.of<AppState>(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScale),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        key: _scaffoldKey,

        body: SafeArea(
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Homepage(),
              Container(),
              // Container(),
              Container(),
              Container()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: kPrimaryColor,

            selectedLabelStyle: TextStyle(
              fontSize: 12
            ),
            unselectedItemColor: Colors.grey,
            onTap: (v) {
              setState(() {

                currentIndex = v;
                pageController.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              });
            },
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(

                icon: Image.asset("assets/images/dashboard.png", height: 20,   color: currentIndex == 0 ? kPrimaryColor : Colors.grey,),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/wallet.png", height: 20, color: currentIndex == 1 ? kPrimaryColor : null),
                label: "Wallet",
              ),
              // BottomNavigationBarItem(
              //   icon: Transform.scale(
              //     scale: 0.6,
              //       child: Padding(
              //         padding:  EdgeInsets.only(bottom: 10),
              //         child: FloatingActionButton(
              //           backgroundColor: Color(0xff2E1963),
              //           child: Icon(Icons.compare_arrows_outlined, size: 30,),
              //           elevation: 0.2,
              //         ),
              //       )),
              //   label: "",
              // ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/pig.png", height: 20, color: currentIndex == 2 ? kPrimaryColor : null,),
                label: "savings",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/more.png", height: 20, color: currentIndex  == 3  ? kPrimaryColor : null,),
                label: "More",
              ),
            ],
          ),
        ),
      ),
    );
  }



}



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
              Container(),
              Container(),
              Container()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
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

              icon: Image.asset("assets/images/dashboard.png", height: 25,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/wallet.png", height: 25,),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: 0.8,
                  child: FloatingActionButton(
                    backgroundColor: Color(0xff2E1963),
                    child: Icon(Icons.compare_arrows_outlined, size: 30,),
                    elevation: 0.2,
                  )),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/pig.png", height: 25,),
              label: "savings",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/more.png", height: 25,),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   try {
  //     setState(() {});
  //     print("LifeState: $state");
  //     if (state == AppLifecycleState.paused && !appState.selectingFile) {
  //       _timer = Timer(Duration(seconds: 30), () {
  //         if (state == AppLifecycleState.paused) {
  //           Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (_) =>
  //                       WelcomeBackPage(
  //
  //                       )),
  //                   (route) => false);
  //         }
  //         _timer.cancel();
  //       });
  //     }
  //     if (state == AppLifecycleState.resumed) {
  //       appState.selectingFile = false;
  //     }
  //   } catch (e) {}
  // }




}



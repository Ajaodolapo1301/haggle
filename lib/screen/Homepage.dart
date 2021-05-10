import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/model/user.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:hive/hive.dart';

import 'login.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Box box;
  User user;
  @override
  void initState() {
    box = Hive.box("user");

    user = box.get('user', defaultValue: null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(child: Text("Welcome to dashboard ${user.username} of ${user.country}" )),
          FlatButton(
            color: kPrimaryColor,
              onPressed: (){
                final box = Hive.box("user");
                box.put('user',null);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()),
                        (Route<dynamic> route) => false);
          }, child: Text("Logout", style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}

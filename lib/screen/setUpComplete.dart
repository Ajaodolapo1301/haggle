

import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/verification.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';






class SetUpComplete extends StatefulWidget {
  @override
  _SetUpCompleteState createState() => _SetUpCompleteState();
}

class _SetUpCompleteState extends State<SetUpComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                children: [
                  Center(child: Image.asset("assets/images/markColor.png", height: 64, width: 64,)),
                  SizedBox(height: 16,),
                  Text("Setup Complete", style: TextStyle(color: Colors.white, fontSize: 1.9 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold ),),
                    SizedBox(height: 16,),
                  Text("Thank you for setting up your HaggleX account", style: TextStyle(color: Colors.white, fontSize: 1.1 * SizeConfig.textMultiplier, fontWeight: FontWeight.w300 ),)
                ],
              ),
              Spacer(),

              CustomButton(

                textColor: Colors.black,
                text: "start exploring".toUpperCase(),
                onPressed: () {
                  // if (formKey.currentState.validate()) {
                  //   handleLogin();
                  // pushTo(context, Register());
                  //
                  //
                  // }
                },
              ),
              // Spacer(),
            ],
          ),
        ),
      ) ,
    );
  }
}

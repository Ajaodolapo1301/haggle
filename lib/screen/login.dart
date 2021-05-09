import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/screen/signup.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';






class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.all(4.5* SizeConfig.heightMultiplier),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 9.8 * SizeConfig.heightMultiplier,),
                Text("Welcome!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 40) ,),
                SizedBox(height: 7.3 * SizeConfig.heightMultiplier,),
                CustomTextField(
//                 focusNode: phoneNode,
                    textActionType: ActionType.next,
                    label: "Phone Number",
                    onSubmit: (v){
                      // _fieldFocusChange(context, phoneNode, passwordNode);
                    },
                    validator: (v) {
                      if (v.isEmpty) {
                        return "Field is required";
                      }
                      // phoneNumber = v;
                      return null;
                    },
                    // prefixIcon: Icons.phone
                  ),
                SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                CustomTextField(
//                          labelStyle: TextStyle(
//                            fontSize: 14,
//                            color:   Colors.black.withOpacity(0.5),
//                            fontWeight: FontWeight.w500,
//                          ),
//                 focusNode: phoneNode,
                  textActionType: ActionType.next,
                  label: "Password (Min. 8 characters)",
                  onSubmit: (v){
                    // _fieldFocusChange(context, phoneNode, passwordNode);
                  },
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Field is required";
                    }
                    // phoneNumber = v;
                    return null;
                  },
                  // prefixIcon: Icons.phone
                ),
                SizedBox(height: 3.9* SizeConfig.heightMultiplier,),
    Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
            Text("Forgot Password", style: TextStyle(color: Colors.white, fontSize:1.3 * SizeConfig.textMultiplier ),)
        ],
    ),

                SizedBox(height: 5.4* SizeConfig.heightMultiplier,),
                CustomButton(

                  textColor: Colors.black,
                  text: "Log In".toUpperCase(),
                  onPressed: () {
                    // if (formKey.currentState.validate()) {
                    //   handleLogin();
                    pushTo(context, Register());
                    //
                    //
                    // }
                  },
                ),
                SizedBox(height: 3.9* SizeConfig.heightMultiplier,),
                Center(child: Text("New User?Create a new account", style: TextStyle(color: Colors.white, fontSize:1.3 * SizeConfig.textMultiplier ),))
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}

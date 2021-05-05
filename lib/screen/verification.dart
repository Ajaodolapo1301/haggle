
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/setUpComplete.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';






class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                text: "",
              ),




              SizedBox(height: 3.8 * SizeConfig.heightMultiplier,),

              Text("Verify your account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),),
              SizedBox(height: 3.8 * SizeConfig.heightMultiplier,),
              WhiteCard(
                child:  Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.9* SizeConfig.heightMultiplier,),

                    Center(child: Image.asset("assets/images/mark2.png", height: 64, width: 64,)),
                      SizedBox(height: 2.9* SizeConfig.heightMultiplier,),

                Text("We just sent a verification code to your email. Please enter the code", textAlign: TextAlign.center, style: TextStyle(fontSize: 1.4 * SizeConfig.textMultiplier),),


                      CustomTextField(
                        cursorColor: Colors.black,

//                 focusNode: phoneNode,
                        textActionType: ActionType.next,
                        label: "Verification code",
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
                      CustomButton(
                  type: ButtonType.gradient,
                        textColor: Colors.white,
                        text: "VERIFY ME".toUpperCase(),
                        onPressed: () {
                          // if (formKey.currentState.validate()) {
                          //   handleLogin();
                          pushTo(context, SetUpComplete());
                          //
                          //
                          // }
                        },
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 3.8 * SizeConfig.heightMultiplier,),
                            Text("This code will expire in 10 minutes", style: TextStyle(fontSize: 1.6 * SizeConfig.textMultiplier )),
                            SizedBox(height: 3.8 * SizeConfig.heightMultiplier,),
                            Text("Resend Code",   style: TextStyle(fontSize: 1.6 * SizeConfig.textMultiplier, color: Colors.black, fontWeight: FontWeight.w700, decoration: TextDecoration.underline ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.4 * SizeConfig.heightMultiplier,),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ) ,
    );
  }
}

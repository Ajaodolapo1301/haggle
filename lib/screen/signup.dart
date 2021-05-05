
import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/selectCountries.dart';
import 'package:haggle/screen/verification.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';






class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Header(
                  text: "",
                ),
                SizedBox(height: 3.8 * SizeConfig.heightMultiplier,),

                WhiteCard(
                  child:  Padding(
                    padding: const EdgeInsets.all(27),
                    child: Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Create a new account", style: TextStyle(fontSize: 1.9 * SizeConfig.textMultiplier, color: Colors.black, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                          CustomTextField(
                            cursorColor: Colors.black,

//                 focusNode: phoneNode,
                            textActionType: ActionType.next,
                            label: "Email Address",
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


                            cursorColor: Colors.black,
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
                          SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                          CustomTextField(
                            cursorColor: Colors.black,

//                 focusNode: phoneNode,
                            textActionType: ActionType.next,
                            label: "Create a username",
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
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              InkWell(
                                onTap: () {
                                  pushTo(context, SelectCountry());

                  },
                                child: Container(
                                  margin:EdgeInsets.only(top: 15) ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xffE8E8E8),
                                    border:Border.all(color: Colors.black, width: 0.5)
                                  ),
                                height: 36,
                                 width: 75,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("(+234)", style: TextStyle(fontSize: 9),)

                                    ],
                                  ),

                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: CustomTextField(
                                  cursorColor: Colors.black,

//                 focusNode: phoneNode,
                                  textActionType: ActionType.next,
                                  label: "Enter your phone number",
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
                              ),
                            ],
                          ),
                          SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                          CustomTextField(
                            cursorColor: Colors.black,

//                 focusNode: phoneNode,
                            textActionType: ActionType.next,
                            label: "Referral code (optional)",
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
                          Center(child: Text("By signing, you agree to HaggleX terms and privacy policy.", style: TextStyle(fontSize: 1.2 * SizeConfig.textMultiplier, color: Colors.black, fontWeight: FontWeight.w300),)),
                          SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                          CustomButton(
                      type: ButtonType.gradient,
                            textColor: Colors.white,
                            text: "SIGN UP".toUpperCase(),
                            onPressed: () {
                              // if (formKey.currentState.validate()) {
                              //   handleLogin();
                              pushTo(context, Verification());
                              //
                              //
                              // }
                            },
                          ),
                          SizedBox(height: 2.4 * SizeConfig.heightMultiplier,),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}

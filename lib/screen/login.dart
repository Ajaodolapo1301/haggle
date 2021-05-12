import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/constants/queries.dart';
import 'package:haggle/model/user.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/screen/Homepage.dart';
import 'package:haggle/screen/signup.dart';
import 'package:haggle/screen/verification.dart';
import 'package:haggle/utils/sizeConfig/commonUtils.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:hive/hive.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../GraphQlConfig.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  var email;

  var password;
  bool isVisiblePassword = false;
  User user;
  ProgressDialog pd;
  void showLoadingDialog(context) async {
    pd = await CommonUtils.showProgressDialog(
        context, "Processing...Please wait!");
  }

  final formKey = GlobalKey<FormState>();
  Queries queries = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.all(4.5 * SizeConfig.heightMultiplier),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9.8 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 7.3 * SizeConfig.heightMultiplier,
                  ),
                  CustomTextField(
                    type: FieldType.email,
                    textActionType: ActionType.next,
                    label: "Email Address",
                    onSubmit: (v) {},
                    validator: (v) {
                      if (v.isEmpty) {
                        return "Field is required";
                      }
                      email = v;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.6 * SizeConfig.heightMultiplier,
                  ),
                  CustomTextField(
                    type: FieldType.text,
                    obscureText: !isVisiblePassword,
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                      child: Text(
                        isVisiblePassword ? "HIDE" : "SHOW",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    textActionType: ActionType.next,
                    label: "Password (Min. 8 characters)",
                    onSubmit: (v) {},
                    validator: (v) {
                      if (v.isEmpty) {
                        return "Field is required";
                      }
                      password = v;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.0 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 1.3 * SizeConfig.textMultiplier),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.4 * SizeConfig.heightMultiplier,
                  ),
                  CustomButton(
                    textColor: Colors.black,
                    text: "Log In".toUpperCase(),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        login();
                      }
                    },
                  ),
                  SizedBox(
                    height: 3.9 * SizeConfig.heightMultiplier,
                  ),
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            pushTo(context, Register());
                          },
                          child: Text(
                            "New User? Create a new account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 1.3 * SizeConfig.textMultiplier),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    showLoadingDialog(context);
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(MutationOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        documentNode: gql(queries.login(
          email,
          password,
        ))));
    if (result.loading) {
    } else if (result.hasException) {
      pd.hide();

      CommonUtils.showMsg(result.exception.graphqlErrors[0].message, context,
          scaffoldKey, Colors.red);
    } else {
      pd.hide();
      user = User.fromJson2(result.data);
      Box box;
      box = Hive.box("user");
      box.put('user', user);

      user.emailVerified
          ? pushToAndClearStack(context, DashboardPage())
          : pushTo(context, Verification());
    }
  }
}

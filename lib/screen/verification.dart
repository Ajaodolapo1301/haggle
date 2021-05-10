import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/constants/queries.dart';
import 'package:haggle/model/user.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/otptime.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/login.dart';
import 'package:haggle/screen/setUpComplete.dart';
import 'package:haggle/utils/sizeConfig/commonUtils.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:hive/hive.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../GraphQlConfig.dart';
import 'Homepage.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();
  Queries queries = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Timer timer;
  final int time = 30;
  int totalTimeInSeconds;
  bool _hideResendButton;
  User user;
  AnimationController _controller;
  ProgressDialog pd;
  void showLoadingDialog(context) async {
    pd = await CommonUtils.showProgressDialog(
        context, "Processing...Please wait!");
  }

  var otp;
  Box box = Hive.box("user");

  bool isLoading = false;
  @override
  void initState() {
    totalTimeInSeconds = time;
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: time))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                _hideResendButton = !_hideResendButton;
              });
            }
          });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _startCountdown();
    box = Hive.box("user");
    user = box.get('user', defaultValue: null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              SizedBox(
                height: 3.8 * SizeConfig.heightMultiplier,
              ),
              Text(
                "Verify your account",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              SizedBox(
                height: 3.8 * SizeConfig.heightMultiplier,
              ),
              WhiteCard(
                child: Padding(
                  padding: const EdgeInsets.all(27),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.9 * SizeConfig.heightMultiplier,
                        ),
                        Center(
                            child: Image.asset(
                          "assets/images/mark2.png",
                          height: 64,
                          width: 64,
                        )),
                        SizedBox(
                          height: 2.9 * SizeConfig.heightMultiplier,
                        ),
                        Text(
                          "We just sent a verification code to your email. Please enter the code",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 1.4 * SizeConfig.textMultiplier),
                        ),
                        CustomTextField(
                          cursorColor: Colors.black,


                          textActionType: ActionType.next,
                          label: "Verification code",
                          onSubmit: (v) {

                          },
                          validator: (v) {
                            if (v.isEmpty) {
                              return "Field is required";
                            }
                            otp = v;
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 3.6 * SizeConfig.heightMultiplier,
                        ),
                        CustomButton(
                          type: ButtonType.gradient,
                          textColor: Colors.white,
                          text: "VERIFY ME".toUpperCase(),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              showLoadingDialog(context);
                              GraphQLClient _client =
                                  graphQLConfiguration.clientToQuery();
                              QueryResult result = await _client.mutate(
                                  MutationOptions(
                                      fetchPolicy: FetchPolicy.networkOnly,
                                      context: <String, dynamic>{
                                        'headers': <String, String>{
                                          'Authorization':
                                              'Bearer ${user.token}',
                                        }
                                      },
                                      documentNode: gql(queries
                                          .otpVerification(int.parse(otp)))));
                              if (result.loading) {
                              } else if (result.hasException) {
                                pd.hide();

                                CommonUtils.showMsg(
                                    result.exception.graphqlErrors[0].message,
                                    context,
                                    scaffoldKey,
                                    kPrimaryColor);
                              } else {
                                pd.hide();
                                CommonUtils.showMsg("Resent Successfully",
                                    context, scaffoldKey, Colors.green);
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  pushToAndClearStack(context, SetUpComplete());
                                });
                              }
                            }
                          },
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 3.8 * SizeConfig.heightMultiplier,
                              ),
                              Text("This code will expire in 10 minutes",
                                  style: TextStyle(
                                      fontSize:
                                          1.6 * SizeConfig.textMultiplier)),
                              SizedBox(
                                height: 3.8 * SizeConfig.heightMultiplier,
                              ),
                              _hideResendButton
                                  ? _getTimerText
                                  : _getResendButton,

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.4 * SizeConfig.heightMultiplier,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  get _getTimerText {
    return Container(
      height: 32,
      child: new Offstage(
        offstage: !_hideResendButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            new SizedBox(
              width: 5.0,
            ),
            OtpTimer(_controller, 15.0, Colors.black)
          ],
        ),
      ),
    );
  }

  get _getResendButton {
    return new InkWell(
      onTap: () async {
        showLoadingDialog(context);
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client.query(
          QueryOptions(
            documentNode: gql(queries.resendOtp(user.email)),
            fetchPolicy: FetchPolicy.noCache,
            context: <String, dynamic>{
              'headers': <String, String>{
                'Authorization': 'Bearer ${user.token}',
              }
            },
          ),
        );
        if (result.loading) {
          setState(() {
            isLoading = true;
          });
        } else if (result.hasException) {
          pd.hide();
          CommonUtils.showMsg(result.exception.graphqlErrors[0].message,
              context, scaffoldKey, kPrimaryColor);
        } else {
          pd.hide();
          CommonUtils.showMsg(
              "Resent Successfully", context, scaffoldKey, Colors.green);
        }
      },
      child: Text(
        isLoading ? "Resending..." : "Resend Code",
        style: TextStyle(
            fontSize: 1.6 * SizeConfig.textMultiplier,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Future<Null> _startCountdown() async {
    setState(() {
      _hideResendButton = true;
      totalTimeInSeconds = time;
    });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/constants/queries.dart';
import 'package:haggle/model/user.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/selectCountries.dart';
import 'package:haggle/screen/verification.dart';
import 'package:haggle/utils/sizeConfig/commonUtils.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:hive/hive.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../GraphQlConfig.dart';






class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Countries countries;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
var email;

var password;
var username;
var phonenumber;
var refcode;
  Box box;
  User user;
  ProgressDialog pd;
  void showLoadingDialog(context) async {
    pd = await CommonUtils.showProgressDialog(
        context, "Processing...Please wait!");
  }
  final formKey = GlobalKey<FormState>();
  Queries queries = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  List<Countries> c = [];
  bool isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kPrimaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          bottom: false,
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
                      child: Form(
                    key: formKey,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Create a new account", style: TextStyle(fontSize: 1.9 * SizeConfig.textMultiplier, color: Colors.black, fontWeight: FontWeight.bold),),
                            SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                            CustomTextField(
                              cursorColor: Colors.black,

                              textActionType: ActionType.next,
                              label: "Email Address",
                              type: FieldType.email,
                              onSubmit: (v){

                              },
                              validator: (v) {
                                if (v.isEmpty) {
                                  return "Field is required";
                                }
                                email = v;
                                return null;
                              },
                              // prefixIcon: Icons.phone
                            ),
                            SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                            CustomTextField(
                              obscureText: !isVisiblePassword ,
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisiblePassword = !isVisiblePassword;
                                  });
                                },
                                child: Text(
                                  isVisiblePassword ? "HIDE" : "SHOW",
                                  style: TextStyle(fontSize: 10, color: kPrimaryColor),
                                ),
                              ),
                              type: FieldType.text,
                              cursorColor: Colors.black,

                              textActionType: ActionType.next,
                              label: "Password (Min. 8 characters)",
                              onSubmit: (v){

                              },
                              validator: (v) {
                                if (v.isEmpty) {
                                  return "Field is required";
                                }
                              password = v;
                                return null;
                              },

                            ),
                            SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                            CustomTextField(

                              type: FieldType.text,
                              cursorColor: Colors.black,
                              textActionType: ActionType.next,
                              label: "Create a username",
                              onSubmit: (v){

                              },
                              validator: (v) {
                                if (v.isEmpty) {
                                  return "Field is required";
                                }
                          username = v;
                                return null;
                              },

                            ),

                            c.isEmpty ?     SizedBox() :     SizedBox(height: 3.6* SizeConfig.heightMultiplier,) ,

                            c.isEmpty ?        Query(
                                options: QueryOptions(
                                    documentNode: gql(queries.fetchCountries()),
                                    fetchPolicy: FetchPolicy.noCache
                                ),     builder: (
                                QueryResult result, {
                                  Refetch refetch,
                                  FetchMore fetchMore,

                                }) {
                              if (result.data == null) {
                                return Center(
                                  child: Text(
                                    "Loading...",
                                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                                  ),
                                );
                              } else{



                                (result.data)["getActiveCountries"].forEach((dat){

                                  c.add(Countries.fromJson(dat));
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) => setState(() {
                                  countries = c[6];
                                  }));

                                });



                                return Container();

                              }
                            }
                            ) : SizedBox(),


                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    pushTo(context, SelectCountry(filterList: c,)).then((value) {

                                    setState(() {


                                      countries = value;

                                    });
                                    });

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
                                        c.isEmpty ? CupertinoActivityIndicator() :  Row(
                                          children: [
                                       SvgPicture.network(countries?.flag, width: 25,),
                                            SizedBox(width: 10,),
                                            Text("+${countries?.callingCode}" ?? "", style: TextStyle(fontSize: 12),),
                                          ],
                                        )

                                      ],
                                    ),

                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: CustomTextField(
                                    cursorColor: Colors.black,

                                    type: FieldType.phone,
                                    textActionType: ActionType.next,
                                    label: "Enter your phone number",
                                    onSubmit: (v){

                                    },
                                    validator: (v) {
                                      if (v.isEmpty) {
                                        return "Field is required";
                                      }
                                      phonenumber = v;
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

                              type: FieldType.text,
                              textActionType: ActionType.next,
                              label: "Referral code (optional)",
                              onChanged: (v){
                                refcode = v;
                              },

                            ),
                            SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                            Center(child: Text("By signing, you agree to HaggleX terms and privacy policy.", style: TextStyle(fontSize: 1.2 * SizeConfig.textMultiplier, color: Colors.black, fontWeight: FontWeight.w300),)),
                            SizedBox(height: 3.6* SizeConfig.heightMultiplier,),
                            CustomButton(
                        type: ButtonType.gradient,
                              textColor: Colors.white,
                              text: "SIGN UP".toUpperCase(),
                              onPressed: () async{
                                if (formKey.currentState.validate()) {
                                  register();

                                      }


                                }
                            ),
                            SizedBox(height: 2.4 * SizeConfig.heightMultiplier,),
                          ],
                        ),
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

  register()async{
    showLoadingDialog(context);
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await  _client.mutate(
        MutationOptions(
            fetchPolicy: FetchPolicy.networkOnly,
            documentNode:  gql( queries.register(email, username, password, refcode, countries.name.toString(), phonenumber.toString(), countries.currencyName.toString(),  countries.callingCode.toString(), countries.flag.toString()))
        )
    );
    if(result.loading){


    }else if(result.hasException){
      pd.hide();

      CommonUtils.showMsg(result.exception.graphqlErrors[0].message,  context, scaffoldKey, Colors.red);
    }else{
      pd.hide();
      user = User.fromJson(result.data);

      box = Hive.box("user");
      box.put('user', user);

      pushTo(context, Verification());
    }
  }
}





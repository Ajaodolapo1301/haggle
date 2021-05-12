import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/model/doMore.dart';
import 'package:haggle/model/marketModel.dart';
import 'package:haggle/model/user.dart';
import 'package:haggle/reusables/DoMoreWidget.dart';
import 'package:haggle/reusables/marketModel.dart';
import 'package:haggle/utils/sizeConfig/dev_utils.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
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



  final List<String> imgList = [
   "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png"
  ];

  List<MarketModel> marketModelList = [
    MarketModel(
      name:"Haggle (HAG)",
      currency: "NGN",
      amount:" 30,000",

      image: "assets/images/flash.png",

    ),
    MarketModel(
        name:"Bitcoin (BTC)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/bitcoin.png",
      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Ethereum (ETH)",
        currency: "NGN",
        amount:" 30,000",
        color: Colors.black,
        image: "assets/images/ethereum.png",
      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Tether (USDT)",
        currency: "NGN",
        amount:" 30,000",
        editSize: true,
        color: Colors.green,
        image: "assets/images/usdt.png",

      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Bitcoin Cash (BCH)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/greenBitcoin.png",
      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Dodgecoin (DOGE)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/dodge.png",
        scaledown: true,
        percentage: "+2.5% ",
        color: Color(0xffe1b302)
    ),
    MarketModel(
        name:"Litecoin (LTC)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/lite.png",
      scaledown: true,
      color: Colors.blue,

      percentage: "+2.5% ",
    ),

  ];
  List<DoMoreModel> doMoreList = [
    DoMoreModel(
      image: "assets/images/upArrow.png",
      title: "Send money instantly",
      subTitle: "Send crypto to another wallet"
    ),
    DoMoreModel(
        image: "assets/images/downArrow.png",
        title: "Receive money from anyone",
        subTitle: "Receive crypto from another wallet"
    ),
    DoMoreModel(
        image: "assets/images/card2.png",
        title: "Virtual Card",

        isIcon: true,
        subTitle: "Make faster payments using HaggleX cards"

    ),
    DoMoreModel(
        image: "assets/images/globe2.png",
        title: "Global Remittance",
        subTitle: "Send money to anyone, anywhere"
    )


  ];
  bool _switchValue = false;

  bool usd = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: kPrimaryColor,

      body: SafeArea(
        child: SingleChildScrollView(
          physics : ClampingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.4 * SizeConfig.heightMultiplier , vertical: 1.2 * SizeConfig.heightMultiplier),
              height: 23.6 * SizeConfig.heightMultiplier,
              color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 2.2 * SizeConfig.heightMultiplier,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),

                            shape: BoxShape.circle
                        ),
                        child: Container(
                            height: 4.5 * SizeConfig.heightMultiplier,
                          width: 9.8 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white),
                            color: pink,
                            shape: BoxShape.circle
                          ),


                          child: Center(child: Text("Aj", style: TextStyle(fontSize: 1.7 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),)),
                        ),
                      ),

                      Text("HaggleX", style: TextStyle(color: Colors.white, fontSize: 1.9 * SizeConfig.textMultiplier, fontWeight: FontWeight.w600), ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white),
                            color: kPrimaryLight,
                            shape: BoxShape.circle
                        ),



                        child: Icon(Icons.notifications, color: Colors.white,size: 20,),
                      )

                    ],
                  ),
                    SizedBox(height:3.2 * SizeConfig.heightMultiplier,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Total portfolio balance", style: TextStyle(color: Colors.white, fontSize: 9),),
                  SizedBox(height: 1.2 * SizeConfig.heightMultiplier,),

                    Row(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text("****", style: TextStyle(color: Colors.white, fontSize: 25),),
                    Spacer(),

                        AnimatedContainer(
                          duration: Duration(microseconds: 300),
                          curve: Curves.decelerate,
                          width: 29.3 * SizeConfig.widthMultiplier,
                          height: 4.9 * SizeConfig.heightMultiplier,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              InkWell(
                                onTap: (){
                              setState(() {
                                usd = !usd;
                              });
                              },
                                child: AnimatedContainer(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: Duration(microseconds: 500),

                                  width: 12 * SizeConfig.widthMultiplier,
                                  height: 3.5 * SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.white),
                                    color: usd ?  gold: Colors.white,

                                  ),
                                  child: Center(child: Text("USD", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),)),

                                ),
                              ),
                              SizedBox(width: 5,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    usd = !usd;
                                  });
                                },
                                child: AnimatedContainer(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: Duration(milliseconds: 300),
                                  width: 12 * SizeConfig.widthMultiplier,
                                  height: 3.5 * SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.white),
                                    color:!usd ?  gold: Colors.white,
                                  ),
                                  child: Center(child: Text("NGN", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),)),
                                ),
                              ),

                            ],
                          ),
                        ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white

                          ),
                        )

                      ],
                    )

                     ],
                   )
                  ],
                ),
            ),

                SizedBox(height:1.2 * SizeConfig.heightMultiplier,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Column(
                    children:  [
                    Container(
                    height: 130,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          fit: BoxFit.cover,

                          image: AssetImage(imgList[0], )
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColor,
                    ),

                  ),
                  //     SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  //       child: Row(
                  //         children: imgList.map((e) {
                  //           print(e);
                  //           return Container(
                  //             height: 130,
                  //             decoration: BoxDecoration(
                  //
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(e)
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: kPrimaryColor,
                  //             ),
                  //
                  //           );
                  //         }).toList(),
                  //
                  //       )
                  //     ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Market place", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 21,),
                            Column(
                              children: marketModelList.map((e) {
                                return  MarketWidget(
                                  marketModel: e,
                                );
                              }).toList(),
                            )

                          ],
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Do more with HaggleX", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            SizedBox(height: 21,),
                            Column(
                              children: doMoreList.map((e) {
                                return  DoMoreWidget(
                                  doMoreModel: e,
                                );
                              }).toList(),
                            )

                          ],
                        ),
                      )

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}














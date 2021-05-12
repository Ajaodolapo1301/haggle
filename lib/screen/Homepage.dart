import 'dart:ui';

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
import 'package:haggle/reusables/trendingWidget.dart';
import 'package:haggle/utils/sizeConfig/dev_utils.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:hive/hive.dart';

import 'login.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>  with TickerProviderStateMixin{

  Box box;
  User user;
  @override
  void initState() {
    box = Hive.box("user");

    user = box.get('user', defaultValue: null);
    super.initState();
  }

  PageController pageController = PageController();

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
      chartImage: "assets/images/haggleChart.png"

    ),
    MarketModel(
        name:"Bitcoin (BTC)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/BTC.png",
      percentage: "+2.5% ",
        chartImage: "assets/images/bitChart.png"
    ),
    MarketModel(
        name:"Ethereum (ETH)",
        currency: "NGN",
        amount:" 30,000",
        color: Colors.black,
        image: "assets/images/ethereum.png",
      percentage: "+2.5% ",
        chartImage: "assets/images/etiChart.png"
    ),
    MarketModel(
        name:"Tether (USDT)",
        currency: "NGN",
        amount:" 30,000",
        editSize: true,
        color: Colors.green,
        image: "assets/images/usdt.png",
      chartImage: "assets/images/teChart.png",

      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Bitcoin Cash (BCH)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/greenBitcoin.png",
      chartImage: "assets/images/bit2Chart.png",
      percentage: "+2.5% ",
    ),
    MarketModel(
        name:"Dodgecoin (DOGE)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/dodge.png",
        scaledown: true,
        percentage: "+2.5% ",
  chartImage: "assets/images/dogChart.png",
        color: Color(0xffe1b302)
    ),
    MarketModel(
        name:"Litecoin (LTC)",
        currency: "NGN",
        amount:" 30,000",
        image: "assets/images/lite.png",
      scaledown: true,
      color: Colors.blue,
      chartImage: "assets/images/lChart.png",

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
String amount = "0.00";
  bool usd = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics : ClampingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.4 * SizeConfig.heightMultiplier , vertical: 1.7 * SizeConfig.heightMultiplier),
              height: 23.6 * SizeConfig.heightMultiplier,
              color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

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

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Total portfolio balance", style: TextStyle(color: Colors.white, fontSize: 9),),



                    Row(

                      children: [
                        RichText(
                          text: TextSpan(
                            text: usd ? "\$":"₦",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:   25,

                            ),
                            children: [
                              TextSpan(
                                  text: amount,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:   25,

                                ),
                              ),

                            ],
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15, left: 6),
                            child: Text(
                              usd ? " USD" :" NGN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:   9,


                              ),
                            ),
                          ),
                    Spacer(),

                        AnimatedContainer(
                          duration: Duration(microseconds: 300),
                          curve: Curves.decelerate,
                          width: 27.3 * SizeConfig.widthMultiplier,
                          height: 4.0 * SizeConfig.heightMultiplier,
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
                                child: Material(

                                  borderRadius: BorderRadius.circular(50),
                                  elevation:usd ?  1.0 : 0.0,
                                  child: AnimatedContainer(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: Duration(microseconds: 500),

                                    width: 12 * SizeConfig.widthMultiplier,
                                    height: 3.5 * SizeConfig.heightMultiplier,
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white, ),
                                      color: usd ?  gold: Colors.white,

                                    ),
                                    child: Center(child: Text("USD", style: TextStyle(fontSize: 9, color: !usd ?Colors.grey : Colors.black, fontWeight: FontWeight.bold),)),

                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  setState(() {
                                    usd = !usd;
                                  });
                                },
                                child: Material(
                                  elevation: !usd ?  1.0 : 0.0,
                                  borderRadius: BorderRadius.circular(50),
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
                                    child: Center(child: Text("NGN", style: TextStyle(fontSize: 9,color: usd ?Colors.grey : Colors.black,  fontWeight: FontWeight.bold),)),
                                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                    Container(
                      height: 16 * SizeConfig.heightMultiplier,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: imgList.length,
                          itemBuilder: (context, i){
                          return  Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(imgList[i]),
                          );
                          },
                      ),
                    ),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Markets", style: TextStyle(fontSize: 1.7 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
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

                      //
                      //
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Do more with HaggleX",  style: TextStyle(fontSize: 1.7 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Column(
                              children: doMoreList.map((e) {
                                return  DoMoreWidget(
                                  doMoreModel: e,
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
                            Text("Trending crypto news",  style: TextStyle(fontSize: 1.7 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),),
                            SizedBox(height: 21,),
                            Column(
                              children: ["1", "2"].map((e) {
                                return  TrendingNewsWidget(

                                );
                              }).toList(),
                            )

                          ],
                        ),
                      ),


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

















import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/model/doMore.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';

class DoMoreWidget extends StatelessWidget {
  final DoMoreModel doMoreModel;
  DoMoreWidget({this.doMoreModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.symmetric(vertical: 7),
      height: 9.3 * SizeConfig.heightMultiplier,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 0.2,
        child: Padding(
          padding:  EdgeInsets.only(left: 1.9 * SizeConfig.heightMultiplier),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff6f4ff)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: doMoreModel.isIcon ? Icon(Icons.credit_card_sharp, color: kPrimaryColor): Image.asset(doMoreModel.image),
                ),
                height: 6.1 * SizeConfig.heightMultiplier,
                width: 10.6 * SizeConfig.widthMultiplier,

              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doMoreModel.title,  style: TextStyle(fontSize: 1.6 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),),
                  Text(doMoreModel.subTitle,  style: TextStyle(fontSize:  1.6 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
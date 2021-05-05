


import 'package:flutter/material.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/reusables/customTextField.dart';
import 'package:haggle/reusables/custom_button.dart';
import 'package:haggle/reusables/whiteBox.dart';
import 'package:haggle/screen/verification.dart';
import 'package:haggle/utils/sizeConfig/header.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';






class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {


  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Container(
                //   height: 45,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(40),
                //     color: Color(0xff6A4BBC),
                //   ),
                //   child: Row(
                //     children: [
                //     Text()
                //
                //     Icon(icon)
                //     ],
                //   ),
                // ),
                Container(
                   height: 45,
              padding: EdgeInsets.symmetric(horizontal: 21),
                  decoration: BoxDecoration(

                      // border: Border.all(color: borderBlue ),
                    color: Color(0xff584783),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.grey,
                          controller: searchController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Search for country",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                  color: Colors.grey)
                          ),
                          style: TextStyle(
                              color: Colors.white,
                          ),
                          // onChanged: (v) {
                          //   if (v.isNotEmpty) {
                          //     setState(() {
                          //       // if (widget.isMap) {
                          //       //   tempList = widget.bankList
                          //       //       .where((bank) =>
                          //       //       bank[widget.textField]
                          //       //           .toString()
                          //       //           .toLowerCase()
                          //       //           .contains(v))
                          //       //       .toList();
                          //       // } else {
                          //       tempList = widget.bankList
                          //           .where((bank) => bank.bank_name
                          //           .toString()
                          //           .toLowerCase()
                          //           .contains(v))
                          //           .toList();
                          //       // }
                          //     });
                          //   } else {
                          //     setState(() {
                          //       tempList = widget.bankList;
                          //     });
                          //   }
                          // },
                        ),
                      ),

                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
SizedBox(height: 20,),

                Divider(color: Colors.grey,)
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/constants/colorConstants.dart';
import 'package:haggle/constants/queries.dart';
import 'package:haggle/utils/sizeConfig/navigation/navigator.dart';

class SelectCountry extends StatefulWidget {
  List<Countries> filterList = [];

  SelectCountry({this.filterList});
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {


  List<Countries> filteredList = [];

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (filteredList.isEmpty) {

      setState(() {
        filteredList = widget.filterList;
      });
    }
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  decoration: BoxDecoration(
                      color: kPrimaryLight,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Expanded(
                        child: TextField(
                          onChanged: (v) {
                            if (v.isNotEmpty) {
                              setState(() {
                                filteredList = widget.filterList
                                    .where((country) => country.name
                                        .toString()
                                        .toLowerCase()
                                        .contains(v))
                                    .toList();
                              });
                            } else {
                              setState(() {
                                filteredList = widget.filterList;
                              });
                            }
                          },
                          cursorColor: Colors.grey,
                          controller: searchController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Search for country",
                              hintStyle:
                                  TextStyle(fontSize: 10, color: Colors.grey)),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                ),
                Column(
                  children: filteredList.map((e) {
                    return GestureDetector(
                        onTap: () {
                          pop(context, e);
                        },
                        child: Tile(e));
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Tile(Countries countries) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SvgPicture.network(
            countries.flag,
            width: 20,
            placeholderBuilder: (
              context,
            ) {
              return CupertinoActivityIndicator();
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${countries.callingCode} ${countries.name}",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Countries {
  String name;
  String flag;
  String callingCode;
  String currencyName;
  Countries({this.name, this.flag, this.callingCode, this.currencyName});
  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
      flag: json["flag"],
      name: json["name"],
      callingCode: json["callingCode"],
      currencyName: json["currencyDetails"]["name"]);
}

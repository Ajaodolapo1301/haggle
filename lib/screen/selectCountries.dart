


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
  Queries queries = Queries();
  List<Countries> c = [];
  String query = '''
    query{
      getActiveCountries{
        name
        flag
        callingCode
  }
    }
  ''';


   List<Countries> filteredList =  [];
  // onItemChanged(String value) {
  //   setState(() {
  //     filteredList = c
  //         .where((string) => string.name.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    if (filteredList.isEmpty) {
      // when widget is built and bank list isn't loaded immediately
      setState(() {
        filteredList =c;
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
                SizedBox(height: 20,),

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
                          onChanged: (v) {
                            if (v.isNotEmpty) {
                              setState(() {
                                // if (widget.isMap) {
                                //   tempList = widget.bankList
                                //       .where((bank) =>
                                //       bank[widget.textField]
                                //           .toString()
                                //           .toLowerCase()
                                //           .contains(v))
                                //       .toList();
                                // } else {
                                filteredList = c
                                    .where((country) => country.name
                                    .toString()
                                    .toLowerCase()
                                    .contains(v))
                                    .toList();
                                // }
                              });
                            } else {
                              setState(() {
                                filteredList = c;
                              });
                            }
                          },
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

                        ),
                      ),

                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
SizedBox(height: 20,),

                Divider(color: Colors.grey,),
              Column(
                children: widget.filterList.map((e){
                  return GestureDetector(
                      onTap: (){
                        pop(context, e);
                      },
                      child: Tile(e));
                }).toList(),
              )
                // Query(
                //     options: QueryOptions(
                //   documentNode: gql(query),
                //       fetchPolicy: FetchPolicy.noCache
                // ),     builder: (
                //     QueryResult result, {
                //       // c.clear();
                //       Refetch refetch,
                //       FetchMore fetchMore,
                //
                //     }) {
                //   if (result.data == null) {
                //       // Countries countries = result.data["getActiveCountries"];
                //     return Center(
                //       child: Text(
                //         "Loading...",
                //         style: TextStyle(fontSize: 20.0, color: Colors.white),
                //       ),
                //     );
                //   } else{
                //   print(filteredList);
                //   c.clear();
                //     (result.data)["getActiveCountries"].forEach((dat){
                //
                //       c.add(Countries.fromJson(dat));
                //
                //     });
                //
                //     // return Container(
                //     //
                //     //   height: 200,
                //     //   child: ListView.builder(
                //     //     itemBuilder: (context, index){
                //     //       return Text(c[index].name);
                //     //     },
                //     //   ),
                //     // );
                //       return
                //     //
                //     //   Container(
                //     //       height: 400,
                //     //     child:  ListView.builder(
                //     //       itemCount: filteredList.length,
                //     //       itemBuilder: (context, i){
                //     //         return Tile(filteredList[i]);
                //     //       },
                //     //     ),
                //     //   );
                //         Column(
                //         children: widget.filterList.map((e){
                //           return GestureDetector(
                //             onTap: (){
                //               pop(context, e);
                //             },
                //               child: Tile(e));
                //         }).toList(),
                //       );
                //   }
                // }
                // ),


              ],
            ),
          ),
        ),
      ) ,
    );
  }

 Widget Tile (Countries countries) {
   return  Padding(
     padding: const EdgeInsets.all(15.0),
     child: Row(
       children: [
         SvgPicture.network(countries.flag, width: 20, placeholderBuilder: (context, ){
           return CupertinoActivityIndicator();

         }, ),
         SizedBox(width: 10,),
         Text("${countries.callingCode} ${countries.name}",  style: TextStyle(fontSize: 15.0, color: Colors.white, ), ),
       ],
     ),
   );
 }


}


class Countries{
  String name;
  String flag;
  String callingCode;
  Countries({this.name, this.flag, this.callingCode});
  factory Countries.fromJson (Map<String, dynamic> json)=>Countries(
    flag: json["flag"],
    name: json["name"],
    callingCode: json["callingCode"]
  );
}
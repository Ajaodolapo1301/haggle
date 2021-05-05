import 'package:flutter/material.dart';

import 'package:haggle/constants/colorConstants.dart';

import 'navigation/navigator.dart';

class Header extends StatelessWidget {
  final String text;
  final VoidCallback preferredActionOnBackPressed;

  const Header({
    Key key,
    this.text,
    this.preferredActionOnBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
        height: 36,
          // width: 45,
          decoration: BoxDecoration(

            color: Color(0xff6A4BBC),
              // color: Color(0xff6A4BBC).withOpacity(0.4),
            borderRadius: BorderRadius.circular(60)
          ),

          // padding: EdgeInsets.all(10),
          child: IconButton(

            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              preferredActionOnBackPressed != null
                  ? preferredActionOnBackPressed()
                  : pop(context);
            },
          ),
        ),
        Spacer(),
        Text(
          text,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Spacer(),
        Opacity(
          opacity: 0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}

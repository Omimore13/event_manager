import 'package:flutter/material.dart';


class Sty {
  TextStyle microText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 12.0,
  );
  TextStyle smallText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 14.0,
  );
  TextStyle mediumText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
  );
  TextStyle mediumBoldText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle largeText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle extraLargeText = TextStyle(
    fontFamily: 'SF',
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );


  InputDecoration textFieldOutlineStyle = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Clr().formBorder,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Clr().primaryColor,
      ),
    ),
  );


}

class Clr{
  Color primaryColor = const Color(0xff005493);
  Color primaryLightColor = const Color(0xff137EFE);
  Color greenColor = const Color(0xff0BCE83);
  Color textcolor = const Color(0xFFa4adb4);
  Color textSecondary = const Color(0xFF9586A8);
  Color hintColor = const Color(0xFFEBEBEB);
  Color white = const Color(0xFFFFFFFF);
  Color bgWhite = const Color(0xFFF6F5F5);
  Color black = const Color(0xFF000000);
  Color shimmerColor = const Color(0xFFABABAB);
  Color formBorder = const Color(0xFFD9D0E3);
  Color red = const Color(0xFFFF0000);
}


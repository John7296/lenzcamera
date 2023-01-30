import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const bool kDedebug = true;

//Base Url
const String imageBaseUrl = "https://dev.lenzcamera.com/webadmin/";

// FONT FAMILY
const String kFontFamily = "Intro";

// COLOR
Map<int, Color> accentColor = {
  50: Color.fromRGBO(253, 66, 91, .1),
  100: Color.fromRGBO(253, 66, 91, .2),
  200: Color.fromRGBO(253, 66, 91, .3),
  300: Color.fromRGBO(253, 66, 91, .4),
  400: Color.fromRGBO(253, 66, 91, .5),
  500: Color.fromRGBO(253, 66, 91, .6),
  600: Color.fromRGBO(253, 66, 91, .7),
  700: Color.fromRGBO(253, 66, 91, .8),
  800: Color.fromRGBO(253, 66, 91, .9),
  900: Color.fromRGBO(253, 66, 91, 1),
};

MaterialColor kAccentMaterialColor = MaterialColor(0xffFD425B, accentColor);

Color kappBarColor = Colors.grey.shade700;

//FONT SIZES
const double kFontSize_16 = 16;
const double kappBarColorFontSize = 12;

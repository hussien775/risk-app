import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//background: #084FC5;
//0D469B
//background: #0063F5;
//
// Map<int,Color> color={
//   50:Color.fromRGBO(255, 255, 255, .1),
//   100:Color.fromRGBO(255, 255, 255, .2),
//   200:Color.fromRGBO(255, 255, 255, .3),
//   300:Color.fromRGBO(255, 255, 255, .4),
//   400:Color.fromRGBO(255, 255, 255, .5),
//   500:Color.fromRGBO(255, 255, 255, .6),
//   600:Color.fromRGBO(255, 255, 255, .7),
//   700:Color.fromRGBO(255, 255, 255, .8),
//   800:Color.fromRGBO(255, 255, 255, .9),
//   900:Color.fromRGBO(255, 255, 255, 1),
// };
// MaterialColor whiteSwatch = MaterialColor(0x00FFFFFF, color);
const primary = Color(0xff084FC5);
const secondary = Color(0xffFCBD68);
const secondary2 = Color(0xfff6f7fb);
const greenColor = Color(0xff4ADE80);
const redColor = Color(0xffDE1A1A);
const yellowColor = Color(0xffFACC15);
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:const Color(0xffF6F7F9),
  appBarTheme: const AppBarTheme(

    backgroundColor: Colors.transparent,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
 // primarySwatch:whiteSwatch ,
  fontFamily: 'tajawal',
);

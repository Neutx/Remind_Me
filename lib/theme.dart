// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb746);
const Color pinkCLr = Color(0xffff4667);
const Color white = Colors.white;
const primaryClr  = bluishClr;
const Color darkGreyClr = Color(0xff121212);
Color darkHeaderClr = Color(0xff424242);




class Themes{
  static final light = ThemeData(

    primaryColor: primaryClr,
    appBarTheme: AppBarTheme(color: primaryClr,),
    brightness: Brightness.light
  );
  static final dark= ThemeData(
    appBarTheme: AppBarTheme(color: darkGreyClr),
    primaryColor: darkGreyClr,
    brightness: Brightness.dark
  );

}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey,
    )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
      )
  );
}
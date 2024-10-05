import 'package:flutter/material.dart';

class Stylings {
  //Colors
  static Color yellow = const Color(0xFFFEC706);
  static Color bgColor =Colors.white;

//textStyles
  static TextStyle titles = const TextStyle(
    fontFamily: 'Inter',
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.black
  );
  static TextStyle subTitles = const TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );
  static TextStyle body = const TextStyle(
      fontFamily: 'Inter',
      fontSize: 11,
      color: Colors.black,
      fontWeight: FontWeight.w400
  );
//media
  static String imgPath = "assets/images";
}
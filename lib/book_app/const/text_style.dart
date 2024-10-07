import 'package:flutter/material.dart';

class TextStyleMethods {
  static TextStyle mainFontStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle baseFontStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle lightFontStyle() {
    return const TextStyle(
      color: Color(0xB50A0909),
      fontSize: 18,
     fontWeight: FontWeight.w600

    );
  }

  static TextStyle priceFontStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle hintFontStyle() {
    return const TextStyle(
      color: Colors.black38,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle lightDetailsFontStyle() {
    return const TextStyle(
      color: Colors.black38,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

}

List<Color> boxColors = const [
  Color(0xffCEEDEF),
  Color(0xffBFBFBF),
  Color(0xffEBECF1),
  Color(0xffFDF7DD),
  Color(0xffF9CFE3),
  Color(0xffFBEBC7),
  Color(0xffE9E8E6)
];

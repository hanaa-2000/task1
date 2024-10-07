import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';

Widget buildButton(String price) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
    ),
    child: Text(
      "\$$price",
      style: TextStyleMethods.priceFontStyle(),
    ),
  );
}

Widget buildSpecialButton(String price) {
  return Container(
    width: 100,
    height: 30,
    //margin: const EdgeInsets.only(top: 5, ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
    ),
    child: Center(
      child: Text(
        "\$$price",
        style: TextStyleMethods.priceFontStyle(),
      ),
    ),
  );
}

Widget buildDetailsButton(String price) {
  return Container(
    width: 100,
    height: 50,
    margin: const EdgeInsets.only(top: 5,right: 30,left: 30 ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.black,
    ),
    child: Center(
      child: Text(
        "\$$price",
        style: TextStyleMethods.priceFontStyle(),
      ),
    ),
  );
}

Widget buildDetailsSpecialButton({ required Widget widget ,void Function()? onTap }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 140,
      height: 50,
      margin: const EdgeInsets.only(top: 15,right: 4,left: 4 ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: widget ,
      ),
    ),
  );
}

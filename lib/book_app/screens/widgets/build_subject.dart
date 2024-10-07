

import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';


Widget buildSubjectWidget(String mainTitle ,void Function()? onTap){
  return Container(
    padding: const EdgeInsets.only(right: 10 ,left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mainTitle , style: TextStyleMethods.baseFontStyle(),),
        InkWell(
            onTap: onTap,
            child: Text("See All" , style: TextStyleMethods.lightFontStyle(),)),

      ],
    ),
  );






}
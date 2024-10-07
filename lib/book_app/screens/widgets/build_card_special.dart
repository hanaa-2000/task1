
import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/widgets/build_button.dart';
import 'package:task1/book_app/screens/widgets/card_image.dart';

Widget buildCardSpecial(context,{img , title , price}){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 2 , vertical: 2),
    width: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardImageWidget(context,img: img),
        const SizedBox(height: 5,),
        Text(title,maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyleMethods.lightFontStyle(),),
        //Text("",style: TextStyleMethods.lightFontStyle(),),
        //const SizedBox(height: 10,),
        const Spacer(),
        buildSpecialButton("$price"),


      ],
    ),
  );




}
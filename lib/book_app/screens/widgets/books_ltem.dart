
import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/widgets/build_button.dart';
import 'package:task1/book_app/screens/widgets/card_image.dart';

Widget  buildBooksItem(context,{index , img  , title , desc , price}){

  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 10,right: 8,left: 8),
    child: SizedBox(
      height: 400,
      width: 200,
      child: Stack(
        children: [
          Positioned(
              child: Container(
                height: 130,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: boxColors[index],
                ),
              ) ,
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: cardImageWidget(context,img: img)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyleMethods.lightDetailsFontStyle(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(desc,style: TextStyleMethods.lightFontStyle(),overflow: TextOverflow.ellipsis,maxLines: 2,),
                  const SizedBox(height: 10,),
                 // const Spacer(),
                  buildSpecialButton("$price"),
               //   const Spacer(),
                  const SizedBox(height: 5,),
                ],
              ),
            ],
          ),
        ],

      ),
    ),
  );





}
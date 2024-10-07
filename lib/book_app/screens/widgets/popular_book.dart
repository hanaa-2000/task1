import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/widgets/build_button.dart';
import 'package:task1/book_app/screens/widgets/card_image.dart';



Widget popularBookWidget(context,{img , author ,title,category}){

  return SizedBox(
    height: MediaQuery.of(context).size.height / 4.5,
    child: Container(
      child: Row(
        children: [
          cardImageWidget(context,img: img),
          Container(
            padding:const EdgeInsets.only(left: 10 , right: 10) ,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author,overflow: TextOverflow.ellipsis,style: TextStyleMethods.lightFontStyle(),),
                Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyleMethods.baseFontStyle(),),
                //Text("Vayuputras",style: TextStyleMethods.baseFontStyle(),),
                Text(category , style: TextStyleMethods.lightFontStyle(),),
                const SizedBox(height:10,),
                buildButton("300"),

              ],
            ),
          )

        ],
      ),

    ),
  );




}
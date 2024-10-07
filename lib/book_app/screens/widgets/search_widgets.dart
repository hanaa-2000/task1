import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/search_screen.dart';

Widget buildTextFormWidgets(context , {searchBook,void Function(String)? onChanged}) {
  return Container(
    child: TextField(
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText: "Search for Books",
        hintStyle: TextStyleMethods.hintFontStyle(),
        suffixIcon:  InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(searchBook: searchBook,),));
          },
          child: const Icon(
            Icons.search_outlined,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

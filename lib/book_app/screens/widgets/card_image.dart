import 'package:flutter/material.dart';

Widget cardImageWidget(context,{img}) {
  return Container(
    padding: const EdgeInsets.all(4),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        img,
        width: MediaQuery.of(context).size.width / 3 ,
        height: MediaQuery.of(context).size.height / 4.5,
        fit: BoxFit.cover,
      ),
    ),
  );
}

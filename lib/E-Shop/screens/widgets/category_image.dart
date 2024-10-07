import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class  CategoryImageItem extends StatelessWidget {
  const CategoryImageItem ({super.key, this.img});
final String ?img;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      img!,
      width: 70,
      height: 90,
      fit: BoxFit.cover,
    ).box
        .color(context.canvasColor)
        .p24.rounded.make();
  }
}

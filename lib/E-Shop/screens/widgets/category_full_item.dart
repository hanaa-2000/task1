import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/E-Shop/screens/widgets/category_image.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/catelog_model.dart';
import 'add_cart.dart';
import 'card_widgets.dart';

class CategoryFullItem extends StatelessWidget {
   const CategoryFullItem({super.key, required this.catalog,required this.title, this.category, this.price, this.img, });
final String ?title;
final String ? category;
final int ? price;
final String ? img;
final Item catalog ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 0,right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           GestureDetector(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => CardWidgets(
                     catalog: catalog,
                   ),
                 ));
               },
               child: CategoryImageItem(img: img,)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title!
                  .text
                  .ellipsis
                  .size(20).color(context.theme.colorScheme.secondary)
                  .fontWeight(FontWeight.w600)
                  .make(),
              SizedBox(
                width: 200,
                child: category!
                    .text
                    .ellipsis.maxLines(2)
                    .color(context.theme.colorScheme.secondary)
                    .make(),
              ),
              30.heightBox,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  "\$$price".text.size(21).bold.make(),
                  70.widthBox,
                  // ElevatedButton(
                  //   onPressed: onPressed,
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: context.theme.colorScheme.primary,
                  //   ),
                  //   child:isCart!?  const Icon(
                  //    CupertinoIcons.checkmark,
                  //     color: Colors.white,
                  //     size: 24,
                  //   ):const Icon(
                  //     CupertinoIcons.cart_badge_plus,
                  //     color: Colors.white,
                  //     size: 24,
                  //   ),
                  // ),

                  SizedBox(
                    width: 70,
                      height: 45,
                      child: AddCart(catalog: catalog,)),
                ],
              ),
            ],
          ),
        ],
      )
          .box
         .color(context.cardColor)
          //.height(180)
          .width(double.infinity)
          .roundedSM
          .padding(const EdgeInsets.symmetric(horizontal: 15, vertical: 15))
          .make(),
    );
  }

}

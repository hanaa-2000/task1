import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/E-Shop/core/themes_app.dart';
import 'package:task1/E-Shop/screens/cart_details.dart';
import 'package:task1/book_app/screens/category.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/my_store.dart';
import '../../model/cart.dart';
import '../../model/catelog_model.dart';
import '../../services/provider_app.dart';


class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key, this.catalog});
  final Item ?catalog;
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartModelProvider>(context);

    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  CartDetails(catalog: catalog,),
            ));
      },
      backgroundColor: context.theme.colorScheme.primary,
      child: const Icon(
        CupertinoIcons.shopping_cart,
        color: Colors.white,
      ),
    ).box.roundedFull.size(55, 55).p1.make().badge(
        count:cart.items.length,
        color: Colors.white,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: MyThemes.darkBluishColor,
        ),
        size: 18);
  }
}

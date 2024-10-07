import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/E-Shop/services/provider_app.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/my_store.dart';
import '../../model/cart.dart';
import '../../model/catelog_model.dart';

class AddCart  extends StatelessWidget {
  const AddCart({super.key, this.catalog});
 final Item ?catalog;

 //int count = 1;
 //bool ? isCart =false;

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);
    //final CartModel _cart = (VxState.store as MyStore).cart!;
   // bool isInCart = CartModel().items.contains(widget.catalog) ?? false;
    final cart = Provider.of<CartModelProvider>(context);
    bool isInCart = catalog != null ? cart.contains(catalog!) : false;

    return  ElevatedButton(
      onPressed: (){
        if (catalog != null && !isInCart) {
          cart.add(catalog!);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.primary,
      ),
      child:isInCart ?  const Icon(
        CupertinoIcons.checkmark,
        color: Colors.white,
        size: 24,
      ):const Icon(
        CupertinoIcons.cart_badge_plus,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}

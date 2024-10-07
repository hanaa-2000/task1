import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/catelog_model.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar:Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl4.red400.bold.make(),
              ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                     backgroundColor: context.theme.colorScheme.primary,
                    //padding: const EdgeInsets.only(right: 32,left: 32),
                  ),
                  child: const Icon(CupertinoIcons.checkmark,color: Colors.white,size: 24, )
              ).wh(150, 50),


            ],
          ).p20(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image!,
              ),
            ).h32(context),
            Expanded(
                child: VxArc(
              arcType: VxArcType.convey,
              height: 20,
              edge: VxEdge.top,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      20.heightBox,
                      catalog.name!.text.bold
                          .color(context.theme.colorScheme.secondary)
                          .makeCentered(),
                      5.heightBox,
                      catalog.desc!.text.xl
                          .color(context.theme.colorScheme.secondary)
                          .makeCentered(),
                      10.heightBox,
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse augue ipsum, auctor eget velit eu, congue gravida metus. Aenean scelerisque blandit turpis, eget vehicula tortor fringilla ac. Sed imperdiet imperdiet tellus at vestibulum. Aliquam lacinia euismod diam, sed lobortis ligula euismod eget. In sem enim, dignissim ut metus ut, lacinia.'
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p32()
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

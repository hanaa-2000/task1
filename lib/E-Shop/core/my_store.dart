import 'package:velocity_x/velocity_x.dart';

import '../model/cart.dart';
import '../model/catelog_model.dart';

class MyStore extends VxStore {
  CatalogModel? catalog;
  CartModel? cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart!.catalog = catalog!;
  }
}
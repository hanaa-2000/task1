import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:task1/E-Shop/model/catelog_model.dart';

class ProviderAppTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkTheme {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleThemeMode(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<List<Item>> loadDta() async {
    await Future.delayed(const Duration(seconds: 1));

    //final respond = await http.get(Uri.parse("assets/files/category.json"));
    final respond = await rootBundle.loadString('assets/files/category.json');
    // final categoryJson = respond.body;
    final decodeData = jsonDecode(respond);
    var productData = decodeData["products"];
    return CatalogModel.items = List.from(productData)
        .map<Item>(
          (item) => Item.fromMap(item),
    )
        .toList();
    notifyListeners();
  }


}

class CartModelProvider  with ChangeNotifier{

     late CatalogModel _catalogModel;

  final List<int?> _itemIds = [];

  CatalogModel get catalog => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalogModel = newCatalog;
    notifyListeners();
  }
  List<Item> get items => _itemIds.map((id) => _catalogModel.getById(id)).toList();

  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners(); // Notify listeners
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners(); // Notify listeners
  }

  bool contains(Item item) {
    return _itemIds.contains(item.id);
  }



}
//
//
// class CartModelProvider with ChangeNotifier {
//
//
//   CatalogModel? _catalogModel; // Make it nullable
//
//   final List<int?> _itemIds = [];
//
//   // Getter for the catalog
//   CatalogModel? get catalog => _catalogModel;
//
//   // Setter for the catalog
//   set catalog(CatalogModel newCatalog) {
//     assert(newCatalog != null);
//     _catalogModel = newCatalog;
//     notifyListeners();
//   }
//
//   // Getter for items in the cart
//   List<Item> get items {
//     if (_catalogModel == null) {
//       return []; // Return an empty list if _catalogModel is not initialized
//     }
//     return _itemIds.map((id) => _catalogModel!.getById(id!)).toList(); // Safe access
//   }
//
//   // Calculate total price
//   num get totalPrice => items.fold(0, (total, current) => total + current.price);
//
//   // Add item to cart
//   void add(Item item) {
//     if (!contains(item)) { // Avoid duplicates
//       _itemIds.add(item.id);
//       notifyListeners(); // Notify listeners
//     }
//   }
//
//   // Remove item from cart
//   void remove(Item item) {
//     _itemIds.remove(item.id);
//     notifyListeners(); // Notify listeners
//   }
//
//   // Check if item is in the cart
//   bool contains(Item item) {
//     return _itemIds.contains(item.id);
//   }
// }

import 'package:flutter_catalouge/core/store.dart';
import 'package:flutter_catalouge/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // assert is redundant with null safety
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items =>
      _itemIds
          .map((id) => _catalog.getById(id))
          .whereType<
            Item
          >() // Filter out any nulls if an item is not found in catalog
          .toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  void add(Item item) {
    _itemIds.add(item.id);
  }
}

// class AddMutation extends VxMutation<MyStore> {
//   final Item item;

//   AddMutation(this.item);
//   @override
//   perform() {
//     store?.cart.add(item);
//   }
// }

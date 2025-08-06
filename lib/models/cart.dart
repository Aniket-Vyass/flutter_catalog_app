import 'package:flutter_catalouge/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal(); //github pe singelton class me convert kia h vo likhna day 24 p fir upload krna abhi kia ni h

  factory CartModel() => cartModel;

  //Catalog Field
  late CatalogModel _catalog;

  //Collection of IDs -store IDs of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds
      .map((id) => _catalog.getById(id))
      .whereType<Item>()
      .toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

import 'package:flutter_catalogue/core/store.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //COLLECTION OF IDS - store IDs of each item
  final List<int> _itemIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, curr) => total + curr.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

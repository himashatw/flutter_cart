import 'package:flutter/material.dart';
import 'package:lab_three/data.dart';

class CartProvider extends ChangeNotifier {
  final Set<Item> _items = {};

  Set<Item> get items => _items;

  double get total => _items.fold(
      0.0, (previousValue, element) => previousValue + element.price);

  // double getTotal() {
  //   double initialValue = 0;
  //   final result = _items.fold<double>(initialValue,
  //       (previousValue, element) => previousValue + element.price);
  //   return result;
  // }

  bool isItemAdded(Item item) {
    return _items.contains(item);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

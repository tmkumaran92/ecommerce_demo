import 'package:ecommerce_grocery/Model/productdata.dart';
import 'package:flutter/material.dart';

enum GroceryState { normal, details, cart }

class GroceryStateBloc with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<CardItem> catalog = List.unmodifiable(cards);
  List<GroceryproductItem> cart = [];
  void changetoNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changetoCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(CardItem product) {
    for (GroceryproductItem item in cart) {
      if (item.product.productName == product.productName) {
        item.increment();
        //item.
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryproductItem(product: product));
    notifyListeners();
  }

  void deleteProduct(GroceryproductItem productItem) {
    cart.remove(productItem);
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(
      0, (previousValue, element) => previousValue + element.quantity);

  double totalpriceElements() => cart.fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.product.price));
}

class GroceryproductItem {
  GroceryproductItem({this.quantity = 1, @required this.product});
  int quantity;
  final CardItem product;

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}

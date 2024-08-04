import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/widgets.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: "Wristwatch",
      price: 89.99,
      description: "Item description",
      imagepath: "lib/pictures/wristwatch.jpg",
    ),
    Product(
      name: "Headwarmer",
      price: 50.99,
      description: "Item description",
      imagepath: "lib/pictures/headwarmer.jpg",
    ),
    Product(
      name: "Hat",
      price: 70.99,
      description: "Item description",
      imagepath: "lib/pictures/Beachhat.jpg",
    ),
    Product(
      name: "Glasses",
      price: 150.99,
      description: "Item description",
      imagepath: "lib/pictures/glasses.jpg",
    ),
    Product(
      name: "Camera",
      price: 200.99,
      description: "Item description",
      imagepath: "lib/pictures/camera.jpg",
    ),
    Product(
      name: "Handbag",
      price: 90.99,
      description: "Item description",
      imagepath: "lib/pictures/handbag.jpg",
    ),
    Product(
      name: "Hoodie",
      price: 90.99,
      description: "Item description",
      imagepath: "lib/pictures/hoodie.jpg",
    ),
  ];

  // user cart
  List<Product> _cart = [];
  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item to cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

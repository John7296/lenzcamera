import 'package:flutter/foundation.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/product.dart';

class DataManager {
  static final DataManager _singleton = DataManager._internal();
  DataManager._internal();
  static DataManager get shared => _singleton;

  List<Product> cartItemsList = [];
  VoidCallback? onCartUpdated;

  // void updateItemToCart(Product product) {
  //   if (product.qty == 0) {
  //     addToCart(product);
  //   } else {}
  // }

  double getItemQuantity(Product product) {
    for (Product element in cartItemsList) {
      if (element.productId == product.productId) {
        return element.qty ?? 0;
      }
    }
    return 0;
  }

  void getCart() {
    NetworkManager.shared.getCart(<String, dynamic>{
      "cusId": 386,
      "guestId": "",
      "pincode": 8,
    }).then((BaseResponse<CartResponse> response) {
      cartItemsList.clear();
      cartItemsList.addAll(response.data!.cartItems!);
      onCartUpdated!();
    }).catchError((e) {
      print(e.toString());
    });
  }

  void addToCart(Product product, VoidCallback updatedCart) {
    onCartUpdated = updatedCart;

    NetworkManager.shared.addToCart(<String, dynamic>{
      "urlKey": product.urlKey,
      "cusId": 386,
      "guestId": "",
      "productQty": 1,
    }).then((BaseResponse response) {
      getCart();
    }).catchError((e) {
      print(e.toString());
    });
  }

  void removeFromCart(Product product) {
    NetworkManager.shared
        .removeFromCart(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void decreaseCartQty(Product product, VoidCallback updatedCart) {
    NetworkManager.shared
        .subCartQty(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void increaseCartQty(Product product, VoidCallback updatedCart) {
    NetworkManager.shared
        .addCartQty()
        .then((BaseResponse response) {})
        .catchError((e) {
          // print(e.toString());
        });
  }
}

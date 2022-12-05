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
  List<Product> wishListItems = [];
  VoidCallback? onCartUpdated;

  void updateItemToCart(Product product, int type,
      {VoidCallback? onUpdate, VoidCallback? onUpdateStarted}) {
    onCartUpdated = onUpdate;

    product.isCartUpdateProgress = true;
    onUpdateStarted!();

    if (type == 1) {
      addToCart(product);
    } else if (type == 2) {
      removeFromCart(product);
    } else if (type == 3) {
      increaseCartQty(product);
    } else if (type == 4) {
      if (product.qty == 1) {
        removeFromCart(product);
      } else {
        decreaseCartQty(product);
      }
    }
  }

  double getItemQuantity(Product product) {
    for (Product element in cartItemsList) {
      if (element.productId == product.productId) {
        return element.qty ?? 0;
      }
    }
    return 0;
  }

  void getCart({Product? product}) {
    NetworkManager.shared.getCart(<String, dynamic>{
      "cusId": 386,
      "guestId": "",
      "pincode": 8,
    }).then((BaseResponse<CartResponse> response) {
      cartItemsList.clear();
      cartItemsList.addAll(response.data!.cartItems!);
      print('cartItemsList items - ${cartItemsList[0].cartItemsId}');
      product?.isCartUpdateProgress = false;
      onCartUpdated!();
    }).catchError((e) {
      print(e.toString());
    });
  }

  void addToCart(Product product) {
    NetworkManager.shared.addToCart(<String, dynamic>{
      "urlKey": product.urlKey,
      "cusId": 386,
      "guestId": "",
      "productQty": 1,
    }).then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void removeFromCart(Product product) {
    NetworkManager.shared.removeFromCart(<String, dynamic>{
      "urlKey": product.urlKey,
      "custId": 386,
      "guestId": "",
    }).then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void decreaseCartQty(Product product) {
    NetworkManager.shared.subCartQty(<String, dynamic>{
      "urlKey": product.urlKey,
      "custId": 386,
      "guestId": "",
    }).then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void increaseCartQty(Product product) {
    NetworkManager.shared
        .addCartQty(getCartItemId(product))
        .then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      // print(e.toString());
    });
  }

  int getCartItemId(Product product) {
    for (Product element in cartItemsList) {
      if (product.productId == element.productId) {
        return element.cartItemsId ?? 0;
      }
    }
    return 0;
  }

  void addToWishlist(Product product) {
    NetworkManager.shared
        .addToWishlist(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void removeFromWishlist(Product product) {
    NetworkManager.shared
        .removeFromWishlist(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void wishListProducts() {
    NetworkManager.shared
        .getWishList()
        .then((BaseResponse<List<Product>> response) {
      wishListItems.clear();
      wishListItems.addAll(response.data!);
      print('Wishlisted items 1- ${wishListItems.first.productId}');
      // print(response.data!.first.catId);
    }).catchError((e) {
      print(e.toString());
    });
  }

  bool iswishListed(Product? product) {
    print('Wishlisted items 2- ${wishListItems.first.productId}');
    if (wishListItems != null) {
      for (Product element in wishListItems) {
        if (element.productId == product!.productId) {
          print('Wishlisted items 3- ${wishListItems[0].productId}');
          return true;
        }
      }
    }
    return false;
    // if(product!.isWhishlisted==false){
    //   return false;
    // }
    // return true;
  }
}

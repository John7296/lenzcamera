import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/filter_data.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/user_location.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class DataManager extends BaseStatefulState {
  static final DataManager _singleton = DataManager._internal();
  DataManager._internal();
  static DataManager get shared => _singleton;

  int? customerId;
  List<Product> cartItemsList = [];
  List<Product> wishListItems = [];
  List<Product>? wishListArrayItem = [];
  VoidCallback? onCartUpdated;
  FilterData? filterData;
  List<Location> locationList = [];

  ValueChanged<String>? onWishlistUpdated;

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
    NetworkManager.shared
        .getCart(
      NetworkManager.shared.userId,
      NetworkManager.shared.guestId,
      NetworkManager.shared.pincodeId,
    )
        .then((BaseResponse<CartResponse> response) {
      cartItemsList.clear();
      cartItemsList.addAll(response.data!.cartItems!);
      product?.isCartUpdateProgress = false;
      onCartUpdated!();
    }).catchError((e) {
      print(e.toString());
    });
  }

  void addToCart(Product product) {
    NetworkManager.shared.addToCart(<String, dynamic>{
      "urlKey": product.urlKey,
      "cusId": NetworkManager.shared.userId,
      "guestId": NetworkManager.shared.guestId,
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
      "custId": NetworkManager.shared.userId,
      "guestId": NetworkManager.shared.guestId,
    }).then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void decreaseCartQty(Product product) {
    NetworkManager.shared.subCartQty(<String, dynamic>{
      "urlKey": product.urlKey,
      "custId": NetworkManager.shared.userId,
      "guestId": NetworkManager.shared.guestId,
    }).then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      // showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void increaseCartQty(Product product) {
    NetworkManager.shared
        .addCartQty(getCartItemId(product))
        .then((BaseResponse response) {
      getCart(product: product);
    }).catchError((e) {
      print(e.toString());
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

  void getWishList() {
    NetworkManager.shared
        .getWishList()
        .then((BaseResponse<List<Product>> response) {
      wishListItems.clear();
      wishListItems.addAll(response.data!);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void addToWishlist(Product product) {
    wishListItems.add(product);
    // onWishlistUpdated = onChange;
    NetworkManager.shared.addToWishlist(<String, dynamic>{
      "urlKey": product.urlKey,
      "custId": NetworkManager.shared.userId,
      "guestId": NetworkManager.shared.guestId,
    }).then((BaseResponse response) {
      showFlashMsg(response.message!);
    }).catchError((e) {
      print(e.toString());
    });
  }

  void removeFromWishlist(Product product) {
    wishListItems.removeWhere((item) => item.productId == product.productId);
    NetworkManager.shared
        .removeFromWishlist(
      NetworkManager.shared.userId,
      NetworkManager.shared.guestId,
      product.urlKey!,
    )
        .then((BaseResponse response) {
      //onWishlistUpdated!(response.message!);
      showFlashMsg(response.message!.toString());
    }).catchError((e) {
      print(e.toString());
    });
  }

  bool iswishListed(Product? product) {
    if (wishListItems != null) {
      for (Product element in wishListItems) {
        if (element.productId == product!.productId) {
          return true;
        }
      }
    }
    return false;
  }

  void clearSession() {
    NetworkManager.shared.userToken;
    NetworkManager.shared.userId;
    NetworkManager.shared.guestId;
    SessionsManager.clearSession();
    wishListItems.clear();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

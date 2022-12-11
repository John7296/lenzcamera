import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/search_screen.dart';
import 'package:lenzcamera/widgets/wishlist_item_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends BaseStatefulState<WishlistScreen> {
  List<Product> wishListItems = [];

  @override
  void initState() {
    super.initState();
    //DataManager.shared.wishListProducts();
    Future.delayed(Duration(milliseconds: 500), () {
      wishListProducts();
      // NetworkManager.shared.getWishList();
    });
  }

  void wishListProducts() {
    showLoader();
    NetworkManager.shared
        .getWishList()
        .then((BaseResponse<List<Product>> response) {
      hideLoader();
      // print(response.data);
      setState(() {
        wishListItems.clear();
        wishListItems.addAll(response.data!);
        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void removeFromWishList(Product wishList) {
    // if (!_form.currentState!.validate()) {
    //   return;
    // }

    NetworkManager.shared
        .removeFromWishlist(
      NetworkManager.shared.userId,
      0,
      wishList.urlKey!,
    )
        .then((BaseResponse response) {
      DataManager.shared.getWishList();
      debugPrint("==========================================");
    }).catchError((e) {
      print(e.toString());
    });
    // print(value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'Wishlist',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(Icons.search_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: wishListItems.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${wishListItems[index].imageUrl}"),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            height: 30,
                            width: 200,
                            child: Text(
                              // 'CANON EF 16-35 MM F/4L IS USM',
                              wishListItems[index].prName ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            // 'QAR 8600.00',
                            "QAR${wishListItems[index].unitPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              DataManager.shared
                                  .removeFromWishlist(wishListItems[index]);
                              // removeFromWishList(wishListItems[index]);
                              // wishListProducts();
                              showLoader();
                              DataManager.shared.getWishList();
                              hideLoader();
                            });
                          },
                          icon: Icon(Icons.delete_outline, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()));
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10)
            ],
          );
        }),
        padding: const EdgeInsets.all(13.0),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
  // Widget _getWishListUI(BuildContext context, int index) {
  //   return InkWell(
  //     onTap: () {},
  //     child: WishlistItemWidget(),
  //   );
  // }
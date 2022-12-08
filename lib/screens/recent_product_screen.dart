import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class RecentProductsScreen extends StatefulWidget {
  const RecentProductsScreen({super.key});

  @override
  State<RecentProductsScreen> createState() => _RecentProductsScreenState();
}

class _RecentProductsScreenState
    extends BaseStatefulState<RecentProductsScreen> {
  List<Product> recentProductsList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _recentProducts();
    });
  }

  void _recentProducts() {
    showLoader();
    NetworkManager.shared
        .recentProducts()
        .then((BaseResponse<List<Product>> response) {
      hideLoader();
      setState(() {
        recentProductsList.clear();
        recentProductsList.addAll(response.data!);
        print(response.data!.first.catId);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  // void addToWishlist(Product product) {
  //   NetworkManager.shared
  //       .addToWishlist(<String, dynamic>{
  //         "urlKey": product.urlKey,
  //         "custId": 386,
  //         "guestId": 1,
  //       })
  //       .then((BaseResponse response) {})
  //       .catchError((e) {
  //         print(e.toString());
  //       });
  // }

  // void removeFromWishlist(Product product) {
  //   NetworkManager.shared
  //       .removeFromWishlist(<String, dynamic>{
  //         "urlKey": product.urlKey,
  //         "custId": 386,
  //         "guestId": 1,
  //       })
  //       .then((BaseResponse response) {})
  //       .catchError((e) {
  //         print(e.toString());
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Recent Products'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Container(
          height: 900,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: recentProductsList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 600,
                  child: Card(
                    child: Column(
                      children: [
                        Stack(children: [
                          Center(
                              child: Container(
                            child: CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl:
                                    "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}"),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (recentProductsList[index].isWhishlisted ==
                                      true) {
                                    DataManager.shared.removeFromWishlist(
                                        recentProductsList[index]);
                                    recentProductsList[index].isWhishlisted =
                                        false;
                                  } else {
                                    DataManager.shared.addToWishlist(
                                        recentProductsList[index]);
                                    recentProductsList[index].isWhishlisted =
                                        true;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: DataManager.shared
                                        .iswishListed(recentProductsList[index])
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ]),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                // "CANON EF 16-35 MM F/4L IS USM ",
                                recentProductsList[index].prName ?? '',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Text("QAR${recentProductsList[index].unitPrice ?? ''}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: (recentProductsList[index]
                                          .stockAvailability!
                                          .length ==
                                      12)
                                  ? Colors.grey
                                  : Colors.yellow),
                          onPressed: () {
                            if (recentProductsList[index]
                                    .stockAvailability!
                                    .length !=
                                12)
                              DataManager.shared.updateItemToCart(
                                  recentProductsList[index], 1, onUpdate: () {
                                setState(() {});
                              }, onUpdateStarted: () {
                                setState(() {});
                              });
                          },
                          child: Center(
                            child: (recentProductsList[index]
                                        .stockAvailability!
                                        .length ==
                                    12)
                                ? Text(
                                    "Out of Stock",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  )
                                : Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),

      // SizedBox(height: 50),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

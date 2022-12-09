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

class FeaturedProductsScreen extends StatefulWidget {
  const FeaturedProductsScreen({super.key});

  @override
  State<FeaturedProductsScreen> createState() => _FeaturedProductsScreenState();
}

class _FeaturedProductsScreenState
    extends BaseStatefulState<FeaturedProductsScreen> {
  List<Product> featuredList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      featuredProducts();
    });
  }

  void featuredProducts() {
    showLoader();
    NetworkManager.shared
        .featuredProducts()
        .then((BaseResponse<List<Product>> response) {
      hideLoader();
      setState(() {
        featuredList.clear();
        featuredList.addAll(response.data!);
        print(response.data!.first.catId);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void addToWishlist(Product product) {
    NetworkManager.shared
        .addToWishlist(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": NetworkManager.shared.userId,
          "guestId": 0,
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void removeFromWishlist(Product product) {
    NetworkManager.shared
        .removeFromWishlist(
          NetworkManager.shared.userId,
          0,
          product.urlKey!,
        )
        .then((BaseResponse response) {})
        .catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Featured Products',
            style: TextStyle(fontSize: 18),
          ),
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
              itemCount: featuredList.length,
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
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${featuredList[index].imageUrl}")),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (featuredList[index].isWhishlisted ==
                                      true) {
                                    DataManager.shared.removeFromWishlist(
                                        featuredList[index]);
                                    featuredList[index].isWhishlisted = false;
                                  } else {
                                    DataManager.shared
                                        .addToWishlist(featuredList[index]);
                                    featuredList[index].isWhishlisted = true;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: DataManager.shared
                                        .iswishListed(featuredList[index])
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
                                featuredList[index].prName ?? '',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Text("QAR${featuredList[index].unitPrice ?? ''}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        if (featuredList[index].isCartUpdateProgress!)
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )),
                        if (featuredList[index].isCartUpdateProgress == false)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Container(
                              width: 160,
                              height: 30,
                              child: featuredList[index].isAddedtoCart()
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            DataManager.shared.updateItemToCart(
                                                featuredList[index], 4,
                                                onUpdate: () {
                                              setState(() {});
                                            }, onUpdateStarted: () {
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff70726f),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xffe3e3e3),
                                          ),
                                          child: Center(
                                              child: Text(
                                            featuredList[index].qty.toString(),
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            DataManager.shared.updateItemToCart(
                                                featuredList[index], 3,
                                                onUpdate: () {
                                              setState(() {});
                                            }, onUpdateStarted: () {
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                              width: 40,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xffe83031),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 12,
                                              )),
                                        ),
                                      ],
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: (featuredList[index]
                                                      .stockAvailability ==
                                                  12)
                                              ? Colors.grey
                                              : Colors.yellow),
                                      onPressed: () {
                                        if (featuredList[index]
                                                .stockAvailability!
                                                .length !=
                                            12)
                                          DataManager.shared.updateItemToCart(
                                              featuredList[index], 1,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                      },
                                      child: Center(
                                        child: (featuredList[index]
                                                    .stockAvailability ==
                                                12)
                                            ? Text(
                                                "Out of Stocks",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              )
                                            : Text(
                                                "ADD",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                      ),
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

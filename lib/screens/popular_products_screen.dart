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

class PopularProductsScreen extends StatefulWidget {
  const PopularProductsScreen({super.key});

  @override
  State<PopularProductsScreen> createState() => _PopularProductsScreenState();
}

class _PopularProductsScreenState
    extends BaseStatefulState<PopularProductsScreen> {
  List<Product> popularProductsList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _popularProducts();
    });
  }

  void _popularProducts() {
    showLoader();
    NetworkManager.shared
        .popularProducts()
        .then((BaseResponse<List<Product>> response) {
      hideLoader();
      setState(() {
        popularProductsList.clear();
        popularProductsList.addAll(response.data!);
      });
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
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
          child: Text('Popular Products'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistScreen(),
                  ));
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
              itemCount: popularProductsList.length,
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
                            height: 80,
                            width: 80,
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://dev.lenzcamera.com/webadmin/${popularProductsList[index].imageUrl}"),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (popularProductsList[index]
                                          .isWhishlisted ==
                                      true) {
                                    DataManager.shared.removeFromWishlist(
                                        popularProductsList[index]);
                                    popularProductsList[index].isWhishlisted =
                                        false;
                                  } else {
                                    DataManager.shared.addToWishlist(
                                        popularProductsList[index]);
                                    popularProductsList[index].isWhishlisted =
                                        true;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: DataManager.shared.iswishListed(
                                        popularProductsList[index])
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ]),
                        Spacer(),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              // "CANON EF 16-35 MM F/4L IS USM ",
                              popularProductsList[index].prName ?? '',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            )),
                        Text("QAR${popularProductsList[index].unitPrice ?? ''}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        if (popularProductsList[index].isCartUpdateProgress!)
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )),
                        if (popularProductsList[index].isCartUpdateProgress ==
                            false)
                          Container(
                            // width: 160,
                            height: 30,
                            child: popularProductsList[index].isAddedtoCart()
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              popularProductsList[index], 4,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xff70726f),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                          child: Center(
                                              child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 12,
                                          )),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xffe3e3e3),
                                        ),
                                        child: Center(
                                            child: Text(
                                          popularProductsList[index]
                                              .qty
                                              .toString(),
                                          style: TextStyle(color: Colors.black),
                                        )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              popularProductsList[index], 3,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        },
                                        child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffe83031),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                )),
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
                                        backgroundColor:
                                            (popularProductsList[index]
                                                        .stockAvailability!
                                                        .length ==
                                                    12)
                                                ? Colors.grey
                                                : Colors.yellow),
                                    onPressed: () {
                                      if (popularProductsList[index]
                                              .stockAvailability!
                                              .length !=
                                          12)
                                        DataManager.shared.updateItemToCart(
                                            popularProductsList[index], 1,
                                            onUpdate: () {
                                          setState(() {});
                                        }, onUpdateStarted: () {
                                          setState(() {});
                                        });
                                    },
                                    child: Center(
                                      child: (popularProductsList[index]
                                                  .stockAvailability!
                                                  .length ==
                                              12)
                                          ? Text(
                                              "Out of Stock",
                                              style: TextStyle(
                                                  fontSize: 15,
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

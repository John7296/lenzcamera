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
            style: TextStyle(
                fontSize: 16, fontFamily: 'Intro', fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishlistScreen()));
                  // getBanners();
                },
                icon: Icon(Icons.favorite_border),
              ),
              if (DataManager.shared.wishListItems.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: new Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      DataManager.shared.wishListItems.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                  // getBanners();
                },
                icon: Icon(Icons.shopping_cart),
              ),
              if (DataManager.shared.cartItemsList.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: new Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      DataManager.shared.cartItemsList.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
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
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 10),
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: featuredList.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                // color: Colors.red,
                                child: FadeInImage.assetNetwork(
                                    height: 200,
                                    width: double.infinity,
                                    placeholder:
                                        'assets/images/placeholder.png',
                                    placeholderFit: BoxFit.contain,
                                    image:
                                        "https://dev.lenzcamera.com/webadmin/${featuredList[index].imageUrl}",
                                    fit: BoxFit.cover),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (featuredList[index].isWhishlisted ==
                                          true) {
                                        DataManager.shared.removeFromWishlist(
                                            featuredList[index]);
                                        featuredList[index].isWhishlisted =
                                            false;
                                      } else {
                                        DataManager.shared
                                            .addToWishlist(featuredList[index]);
                                        featuredList[index].isWhishlisted =
                                            true;
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
                            ],
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            // color: Colors.green,
                            child: Text(
                              featuredList[index].prName ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'Intro'),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: 20,
                            // color: Colors.yellow,
                            child: Text(
                              "QAR ${featuredList[index].unitPrice}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Intro',
                                  color: Colors.grey),
                            ),
                          ),
                          if (featuredList[index].isCartUpdateProgress!)
                            Container(
                                // color:Colors.yellow,
                                height: 20,
                                width: 20,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.grey,
                                  ),
                                )),
                          if (featuredList[index].isCartUpdateProgress == false)
                            Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              // width: 160,
                              height: 25,
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
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                )),
                                            child: Center(
                                                child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 12,
                                            )),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xffe3e3e3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              featuredList[index]
                                                  .qty!
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                  fontFamily: 'Intro',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
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
                                                )),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: (featuredList[index]
                                                      .stockAvailability!
                                                      .length ==
                                                  12)
                                              ? Colors.grey.shade300
                                              : Colors.yellow),
                                      onPressed: () {
                                        if (featuredList[index]
                                                .stockAvailability!
                                                .length !=
                                            12)
                                          // print(popularProductsList[
                                          //         index]
                                          //     .urlKey);

                                          DataManager.shared.updateItemToCart(
                                              featuredList[index], 1,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             CartScreen()));
                                      },
                                      child: Center(
                                        child: (featuredList[index]
                                                    .stockAvailability!
                                                    .length ==
                                                12)
                                            ? Text(
                                                "OUT OF STOCK",
                                                style: TextStyle(
                                                    fontFamily: 'Intro',
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade700),
                                              )
                                            : Text(
                                                "ADD",
                                                style: TextStyle(
                                                    fontFamily: 'Intro',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
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

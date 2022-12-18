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
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:sizer/sizer.dart';

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
          child: Text(
            'Recent Products',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Intro', fontSize: 16),
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
      body: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: recentProductsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(recentProductsList[index]),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(0.5.h),
                child: Container(
                  // height: 10.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(.5.h)),
                      color: Colors.white
                      ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 14.h,
                            // color: Colors.red,
                            child: Center(
                              child: FadeInImage.assetNetwork(
                                  height: 20.h,
                                  width: 20.h,
                                  placeholder: 'assets/images/placeholder.png',
                                  placeholderFit: BoxFit.contain,
                                  image:
                                      "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (recentProductsList[index]
                                          .isWhishlisted ==
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
                                size: 3.h,
                                color: DataManager.shared.iswishListed(
                                        recentProductsList[index])
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1.h),
                      Container(
                        height: 3.h,
                        child: Text(
                          recentProductsList[index].prName ?? '',
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 8.sp, fontFamily: 'Intro'),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // SizedBox(height: 1.h),
                      Container(
                        height: 1.5.h,
                        child: Text(
                          "QAR ${recentProductsList[index].unitPrice}",
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Intro',
                              color: Colors.grey),
                        ),
                      ),
                      if (recentProductsList[index].isCartUpdateProgress!)
                        Container(

                            // color:Colors.yellow,
                            height: 3.h,
                            // width: 3.h,
                            child: Padding(
                              padding: EdgeInsets.all(0.6.h),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.grey,
                              ),
                            )),
                      if (recentProductsList[index].isCartUpdateProgress ==
                          false)
                        Container(
                          // width: 160,
                          height: 4.h,
                          child: recentProductsList[index].isAddedtoCart()
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        DataManager.shared.updateItemToCart(
                                            recentProductsList[index], 4,
                                            onUpdate: () {
                                          setState(() {});
                                        }, onUpdateStarted: () {
                                          setState(() {});
                                        });
                                      },
                                      child: Container(
                                        width: 15.w,
                                        // height: 15.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xff70726f),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
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
                                      width: 15.w,
                                      // height: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe3e3e3),
                                      ),
                                      child: Center(
                                        child: Text(
                                          recentProductsList[index]
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
                                            recentProductsList[index], 3,
                                            onUpdate: () {
                                          setState(() {});
                                        }, onUpdateStarted: () {
                                          setState(() {});
                                        });
                                      },
                                      child: Container(
                                        width: 15.w,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xffe83031),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
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
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                            (recentProductsList[index]
                                                        .stockAvailability!
                                                        .length ==
                                                    12)
                                                ? Colors.grey.shade300
                                                : Colors.yellow),
                                    onPressed: () {
                                      if (recentProductsList[index]
                                              .stockAvailability!
                                              .length !=
                                          12)
                                        // print(recentProductsList[
                                        //         index]
                                        //     .urlKey);

                                        DataManager.shared.updateItemToCart(
                                            recentProductsList[index], 1,
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
                                      child: (recentProductsList[index]
                                                  .stockAvailability!
                                                  .length ==
                                              12)
                                          ? Text(
                                              "OUT OF STOCK",
                                              style: TextStyle(
                                                  fontFamily: 'Intro',
                                                  fontSize: 1.5.h,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade700),
                                            )
                                          : Text(
                                              "ADD",
                                              style: TextStyle(
                                                  fontFamily: 'Intro',
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                    ),
                                  ),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          
        },
      ),

      // SizedBox(height: 50),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

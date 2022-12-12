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
      body: 
      Container(
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                            height: 100,
                            width: 150,
                            child: CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}"),
                          ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
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
                                color: DataManager.shared.iswishListed(
                                        recentProductsList[index])
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
                              recentProductsList[index].prName ?? '',
                              style: TextStyle(
                                  fontSize: 10, fontFamily: 'Intro'),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            )),
                        Text("QAR${recentProductsList[index].unitPrice ?? ''}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        if (recentProductsList[index].isCartUpdateProgress!)
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                ),
                              )),
                        if (recentProductsList[index].isCartUpdateProgress ==
                            false)
                          Container(
                            // width: 160,
                            margin: EdgeInsets.only(bottom:5,left: 10,right: 10),
                            height: 30,
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
                                          width: 40,
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
                                            color: Colors.black,
                                            size: 12,
                                          )),
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
                                          recentProductsList[index]
                                              .qty
                                              .toString(),
                                          style: TextStyle(color: Colors.black),
                                        )),
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
                                            )),
                                      ),
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                            (recentProductsList[index]
                                                        .stockAvailability!
                                                        .length ==
                                                    12)
                                                ? Colors.grey.shade400
                                                : Colors.yellow),
                                    onPressed: () {
                                      if (recentProductsList[index]
                                              .stockAvailability!
                                              .length !=
                                          12)
                                        DataManager.shared.updateItemToCart(
                                            recentProductsList[index], 1,
                                            onUpdate: () {
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
                                              "OUT OF STOCK",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade800),
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

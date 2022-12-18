import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/filter_data.dart';
import 'package:lenzcamera/model/product.dart';

import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/filter_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  //  final SearchProducts? product;

  SearchScreen({
    Key? key,
    //  this.product
  }) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseStatefulState<SearchScreen> {
  String? _searchString = "";
  // bool isLoading = true;
  bool isPaging = false;
  bool isSearchStarted = false;
  int currentPage = 1;

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), (() {
      searchProducts();
    }));
  }

  void searchProducts() {
    showLoader();

    isSearchStarted = true;

    NetworkManager.shared.searchProducts(<String, dynamic>{
      "pagesize": 20,
      "custId": NetworkManager.shared.userId,
      "currentpage": currentPage,
      "filtervalues": (DataManager.shared.filterData?.brand != null ||
              DataManager.shared.filterData?.manufacturer != null ||
              DataManager.shared.filterData?.lensMount != null)
          ? "${DataManager.shared.filterData?.brand?.attrId}, ${DataManager.shared.filterData?.manufacturer?.attrId},  ${DataManager.shared.filterData?.lensMount?.attrId ?? ''}"
          : "",
      "guestId": "",
      "maxPrice": DataManager.shared.filterData?.maxPrice ?? 1000000,
      "minPrice": DataManager.shared.filterData?.minPrice ?? 0,
      "pincode": 8,
      "filter": {
        "category": DataManager.shared.filterData?.category?.catId ?? '',
      },
      "sortorder": {"field": "prName", "direction": "default"},
      "searchstring": _searchString,
    }).then((BaseResponse<SearchProductsResponse> response) {
      hideLoader();
      setState(() {
        // isLoading = false;
        _products.clear();
        _products.addAll(response.data!.products!);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Search"),
          titleTextStyle: TextStyle(
              fontSize: 14,
              fontFamily: "Intro Bold.otf",
              fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          backgroundColor: Colors.grey.shade700,
          actions: [
         Stack(
              children: [
                IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishlistScreen()));
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
                        fontSize:10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),)
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
              if(DataManager.shared.cartItemsList.isNotEmpty)
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
                  ),)
              ], 
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Container(
              height: 50,
             
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Color(0xffe3e3e3),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: <Widget>[
                   Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.search_rounded,
                          size: 30, color: Colors.grey)),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {
                        _searchString = value;
                      },
                      onSubmitted: (value) {
                        searchProducts();
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "SEARCH PRODUCTS",
                          hintStyle: TextStyle(
                              fontFamily: "Intro-Regular.otf",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                        height: 20,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterScreen())).then(
                                (value) {
                                  searchProducts();
                                },
                              );
                            },
                            child: Image.asset("assets/images/filter_icon.png"))),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              height: 600,
              color: Colors.grey.shade100,
              child:
                  // isLoading
                  //     ? Center(child: CircularProgressIndicator())
                  //     :
                  ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(_products[index])));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 15.h,
                                // height:120,
                                  //width:400
                                  width: 800.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey,
                                    //     offset: Offset(0.0, 1.0), //(x,y)
                                    //     blurRadius: 6.0,
                                    //   ),
                                    // ],
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        "https://dev.lenzcamera.com/webadmin/${_products[index].imageUrl}"),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Row(
                                              children: [
                                                Container(
                                                  // height: 30,
                                                 // width: 150,
                                                 width:20.h,

                                                  child: Text(
                                                    // 'CANON EF 16-35 MM F/4L IS USM',
                                                    _products[index].prName ?? '',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Intro-Regular.otf",
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              // 'QAR 8600.00',
                                              "QAR ${_products[index].unitPrice}",
                                              style: TextStyle(
                                                  fontFamily: "Intro",
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // Padding(
                                          //   padding:  EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.h
                                          //       //left: 30.h, right: 10
                                          //       ),
                                            // child:
                                             Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_products[index]
                                                              .isWhishlisted ==
                                                          true) {
                                                        DataManager.shared
                                                            .removeFromWishlist(
                                                                _products[index]);
                                                        _products[index]
                                                                .isWhishlisted =
                                                            false;
                                                      } else {
                                                        DataManager.shared
                                                            .addToWishlist(
                                                                _products[index]);
                                                        _products[index]
                                                            .isWhishlisted = true;
                                                      }
                                                    });
    
                                                    // setState(() {
                                                    //   DataManager.shared.removeFromWishlist(
                                                    //       _products[index]);
                                                    // });
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    size:25,
                                                    color: DataManager.shared
                                                            .iswishListed(
                                                                _products[index])
                                                        ? Colors.red
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          // ),
                                          SizedBox(height: 20),
                                          if (_products[index]
                                              .isCartUpdateProgress!)
                                            SizedBox(
                                                height: 15,
                                                width: 15,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                )),
                                          if (_products[index]
                                                  .isCartUpdateProgress ==
                                              false)
                                            Row(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 30,
                                                  child: _products[index]
                                                          .isAddedtoCart()
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                DataManager.shared
                                                                    .updateItemToCart(
                                                                        _products[
                                                                            index],
                                                                        4,
                                                                        onUpdate:
                                                                            () {
                                                                  setState(() {});
                                                                }, onUpdateStarted:
                                                                            () {
                                                                  setState(() {});
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 25,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Color(
                                                                            0xff70726f),
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(5),
                                                                          bottomLeft:
                                                                              Radius.circular(5),
                                                                        )),
                                                                child: Center(
                                                                    child: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 12,
                                                                )),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xffe3e3e3),
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                _products[index]
                                                                    .qty
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                DataManager.shared
                                                                    .updateItemToCart(
                                                                        _products[
                                                                            index],
                                                                        3,
                                                                        onUpdate:
                                                                            () {
                                                                  setState(() {});
                                                                }, onUpdateStarted:
                                                                            () {
                                                                  setState(() {});
                                                                });
                                                              },
                                                              child: Container(
                                                                  width: 25,
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Color(
                                                                              0xffe83031),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(5),
                                                                            bottomRight:
                                                                                Radius.circular(5),
                                                                          )),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 12,
                                                                  )),
                                                            ),
                                                          ],
                                                        )
                                                      : ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                Colors.yellow,
                                                          ),
                                                          onPressed: () {
                                                            // print(popularProductsList[
                                                            //         index]
                                                            //     .urlKey);
                                                            DataManager.shared
                                                                .updateItemToCart(
                                                                    _products[
                                                                        index],
                                                                    1,
                                                                    onUpdate: () {
                                                              setState(() {});
                                                            }, onUpdateStarted:
                                                                        () {
                                                              setState(() {});
                                                            });
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) =>
                                                            //             CartScreen()));
                                                          },
                                                          child: Center(
                                                            child: (_products[
                                                                            index]
                                                                        .stockAvailability!
                                                                        .length ==
                                                                    12)
                                                                ? Text(
                                                                    "OUT OF STOCK",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            8,
                                                                        fontFamily:
                                                                            "Intro",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700),
                                                                  )
                                                                : Text(
                                                                    "ADD",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Intro",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

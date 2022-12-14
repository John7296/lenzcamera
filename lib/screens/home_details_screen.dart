import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/add_address.dart';
import 'package:lenzcamera/model/banners.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/main_banners.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/category_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/popular_products_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/recent_product_screen.dart';
import 'package:lenzcamera/screens/return_policy_screen.dart';
import 'package:lenzcamera/screens/search_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends BaseStatefulState<HomeDetailsScreen> {
  List<TopCategories> categoryList = [];
  List<Product> featuredList = [];
  List<Product> popularProductsList = [];
  List<Product> recentProductsList = [];
  List<Product> relatedProductsList = [];
  List<Banners> bannerList = [];
  String? cartItemId;

  Product? featuredProducts;
  Product? products;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      getTopCategories();
      _featuredProducts();

      // _updateDeviceToken();
    });
    DataManager.shared.getWishList();
  }

  void getTopCategories() {
    showLoader();
    NetworkManager.shared
        .getTopCategories()
        .then((BaseResponse<List<TopCategories>> response) {
      // showFlashMsg(response.message!);
      setState(() {
        categoryList.clear();
        categoryList.addAll(response.data!);
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void _featuredProducts() {
    NetworkManager.shared
        .featuredProducts()
        .then((BaseResponse<List<Product>> response) {
      // showFlashMsg(response.message!);
      hideLoader();
      setState(() {
        featuredList.clear();
        featuredList.addAll(response.data!);
      });
      getBanners();
      popularProducts();
      recentProducts();
    }).catchError((e) {
      showFlashMsg(e.toString());
      hideLoader();
      print(e.toString());
    });
  }

  void popularProducts() {
    NetworkManager.shared
        .popularProducts()
        .then((BaseResponse<List<Product>> response) {
      // showFlashMsg(response.message!);
      DataManager.shared.getCart();

      setState(() {
        popularProductsList.clear();
        popularProductsList.addAll(response.data!);
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void recentProducts() {
    NetworkManager.shared
        .recentProducts()
        .then((BaseResponse<List<Product>> response) {
      // print(response.data);
      setState(() {
        recentProductsList.clear();
        recentProductsList.addAll(response.data!);
        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void getBanners() {
    NetworkManager.shared
        .getBanner(
      NetworkManager.shared.userId,
      0,
      8,
    )
        .then((BaseResponse<MainBanner> response) {
      setState(() {
        bannerList.clear();
        bannerList.addAll(response.data!.MainBanners!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 100,
          width: 200,
          child: Image(
            image: AssetImage("assets/images/logo_lenzcamera.png"),
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
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.circle_outlined),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Doha',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Intro'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Intro'),
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(Icons.search_rounded,
                                size: 30, color: Colors.grey.shade700),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            child: Text(
                              "SEARCH PRODUCTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                  fontFamily: 'Intro'),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage("assets/images/camerabanner.png"),
                    fit: BoxFit.fill,
                    // width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            height: 150,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: FadeInImage.assetNetwork(
                                      height: 110,
                                      width: 110,
                                      placeholder:
                                          'assets/images/placeholder.png',
                                      placeholderFit: BoxFit.contain,
                                      image:
                                          "https://dev.lenzcamera.com/webadmin/${categoryList[index].imageUrl}",
                                      fit: BoxFit.cover),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    categoryList[index].catName ?? '',
                                    style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        fontFamily: 'Intro'),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Container(
              height: 435,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          'Featured Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'Intro'),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FeaturedProductsScreen()));
                            },
                            child: Text(
                              'View All ➜',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Intro'),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      height: 380,
                      // color: Colors.red,
                      child: StaggeredGridView.countBuilder(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        itemCount: featuredList.length,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                              featuredList[index])));
                            },
                            child: Container(
                              height: 190,
                              child: Card(
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
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (featuredList[index]
                                                          .isWhishlisted ==
                                                      true) {
                                                    DataManager.shared
                                                        .removeFromWishlist(
                                                            featuredList[
                                                                index]);
                                                    featuredList[index]
                                                            .isWhishlisted =
                                                        false;
                                                  } else {
                                                    DataManager.shared
                                                        .addToWishlist(
                                                            featuredList[
                                                                index]);
                                                    featuredList[index]
                                                            .isWhishlisted =
                                                        true;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 20,
                                                color: DataManager.shared
                                                        .iswishListed(
                                                            featuredList[
                                                                index])
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
                                              fontSize: 12,
                                              fontFamily: 'Intro'),
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
                                      if (featuredList[index]
                                          .isCartUpdateProgress!)
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
                                      if (featuredList[index]
                                              .isCartUpdateProgress ==
                                          false)
                                        Container(
                                          // width: 160,
                                          height: 20,
                                          child: featuredList[index]
                                                  .isAddedtoCart()
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        DataManager.shared
                                                            .updateItemToCart(
                                                                featuredList[
                                                                    index],
                                                                4,
                                                                onUpdate: () {
                                                          setState(() {});
                                                        }, onUpdateStarted: () {
                                                          setState(() {});
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff70726f),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5),
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
                                                      width: 50,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffe3e3e3),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          featuredList[index]
                                                              .qty!
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Intro',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        DataManager.shared
                                                            .updateItemToCart(
                                                                featuredList[
                                                                    index],
                                                                3,
                                                                onUpdate: () {
                                                          setState(() {});
                                                        }, onUpdateStarted: () {
                                                          setState(() {});
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xffe83031),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5),
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
                                                      backgroundColor:
                                                          (featuredList[index]
                                                                      .stockAvailability!
                                                                      .length ==
                                                                  12)
                                                              ? Colors
                                                                  .grey.shade300
                                                              : Colors.yellow),
                                                  onPressed: () {
                                                    if (featuredList[index]
                                                            .stockAvailability!
                                                            .length !=
                                                        12)
                                                      // print(popularProductsList[
                                                      //         index]
                                                      //     .urlKey);

                                                      DataManager.shared
                                                          .updateItemToCart(
                                                              featuredList[
                                                                  index],
                                                              1, onUpdate: () {
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
                                                                fontFamily:
                                                                    'Intro',
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700),
                                                          )
                                                        : Text(
                                                            "ADD",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Intro',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                  ),
                                                ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: bannerList.length,
                      itemBuilder: (context, itemIndex, realIndex) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:
                              //  FadeInImage.assetNetwork(
                              //                         height: 250,
                              //                         width: double.infinity,
                              //                         placeholder:
                              //                             'assets/images/placeholder.png',
                              //                         image:
                              //                             "https://dev.lenzcamera.com/webadmin/${bannerList[itemIndex].imageUrl}",
                              //                         fit: BoxFit.cover),
                              Image.network(
                                  "https://dev.lenzcamera.com/webadmin/${bannerList[itemIndex].imageUrl}"),
                        );
                        //   CachedNetworkImage(
                        //       fit: BoxFit.fitWidth,
                        //       imageUrl:"https:asaad.in/webadmin/${bannerlist?.data?.elementAt(0).items?.elementAt(1).imageUrl}",
                        // ));
                      },
                      options: CarouselOptions(
                          height: 120,
                          viewportFraction: 1,
                          autoPlay: true,
                          onPageChanged: (itemIndex, reason) {
                            setState(() {
                              // activeIndexBanner = itemIndex;
                            });
                          }),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 5),
                    //   child: AnimatedSmoothIndicator(
                    //     count:
                    //         // bannerlist?.data?.first.items?.length??0,
                    //         detailslist?.data?.first.items?.length ?? 0,
                    //     activeIndex: activeIndexBanner,
                    //     effect: WormEffect(
                    //       activeDotColor: Colors.white,
                    //       dotColor: Colors.lightGreenAccent,
                    //       dotHeight: 6,
                    //       dotWidth: 6,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: CarouselSlider.builder(
            //     options: CarouselOptions(
            //       height: 150.0,
            //       autoPlay: true,
            //     ),
            //     itemCount: bannerList.length,
            //     itemBuilder: (BuildContext context, itemIndex, realIndex) {
            //       return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child:
            //           // Image(
            //           //   image: AssetImage("assets/images/logo_lenzcamera.png"),
            //           // )
            //           InkWell(
            //             child: CachedNetworkImage(
            //             imageUrl:
            //                 "https://dev.lenzcamera.com/webadmin/${bannerList[itemIndex].imageUrl}",fit: BoxFit.contain),
            //           ),
            //           );
            //     },
            //   ),
            // ),
            SizedBox(height: 10),
            Container(
              height: 750,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          'Popular Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'Intro'),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PopularProductsScreen()));
                            },
                            child: Text(
                              'View All ➜',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Intro'),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 690,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            itemCount: popularProductsList.length,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                              popularProductsList[index]),
                                    ),
                                  );
                                }),
                                child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 125),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (popularProductsList[
                                                                index]
                                                            .isWhishlisted ==
                                                        true) {
                                                      DataManager.shared
                                                          .removeFromWishlist(
                                                              popularProductsList[
                                                                  index]);
                                                      popularProductsList[index]
                                                              .isWhishlisted =
                                                          false;
                                                    } else {
                                                      DataManager.shared
                                                          .addToWishlist(
                                                              popularProductsList[
                                                                  index]);
                                                      popularProductsList[index]
                                                          .isWhishlisted = true;
                                                    }
                                                    // DataManager.shared
                                                    //     .getWishList();
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: DataManager.shared
                                                          .iswishListed(
                                                              popularProductsList[
                                                                  index])
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: FadeInImage.assetNetwork(
                                                  height: 100,
                                                  width: 100,
                                                  placeholder:
                                                      'assets/images/placeholder.png',
                                                  placeholderFit: BoxFit.fill,
                                                  image:
                                                      "https://dev.lenzcamera.com/webadmin/${popularProductsList[index].imageUrl}",
                                                  fit: BoxFit.cover),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          popularProductsList[index].prName ??
                                              '',
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Intro'),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          // 'QAR 120.00',
                                          "QAR ${popularProductsList[index].unitPrice.toString()}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Intro',
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(height: 5),
                                        if (popularProductsList[index]
                                            .isCartUpdateProgress!)
                                          SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                        if (popularProductsList[index]
                                                .isCartUpdateProgress ==
                                            false)
                                          Container(
                                            width: 160,
                                            height: 30,
                                            child:
                                                popularProductsList[index]
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
                                                                      popularProductsList[
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
                                                              width: 40,
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
                                                            width: 80,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffe3e3e3),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                popularProductsList[
                                                                        index]
                                                                    .qty!
                                                                    .toStringAsFixed(
                                                                        0),
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Intro',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              DataManager.shared
                                                                  .updateItemToCart(
                                                                      popularProductsList[
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
                                                                width: 40,
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
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0,
                                                            backgroundColor: (popularProductsList[
                                                                            index]
                                                                        .stockAvailability!
                                                                        .length ==
                                                                    12)
                                                                ? Colors.grey
                                                                    .shade300
                                                                : Colors
                                                                    .yellow),
                                                        onPressed: () {
                                                          if (popularProductsList[
                                                                      index]
                                                                  .stockAvailability!
                                                                  .length !=
                                                              12)
                                                            // print(popularProductsList[
                                                            //         index]
                                                            //     .urlKey);
                                                            DataManager.shared
                                                                .updateItemToCart(
                                                                    popularProductsList[
                                                                        index],
                                                                    1, onUpdate:
                                                                        () {
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
                                                          child: (popularProductsList[
                                                                          index]
                                                                      .stockAvailability!
                                                                      .length ==
                                                                  12)
                                                              ? Text(
                                                                  "OUT OF STOCK",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          'Intro',
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700),
                                                                )
                                                              : Text(
                                                                  "ADD",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontFamily:
                                                                          'Intro',
                                                                      color: Colors
                                                                          .black),
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
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(
              height: 300,
              color: Colors.white,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: Text(
                          'Recent Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'Intro'),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 10),
                        child: TextButton(
                            onPressed: () {
                              // _recentProducts();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecentProductsScreen()));
                            },
                            child: Text(
                              'View All ➜',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Intro'),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: recentProductsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                    recentProductsList[index]),
                              ),
                            );
                          },
                          child: Container(
                            height: 200,
                            width: 180,
                            child: Card(
                              shape: RoundedRectangleBorder(),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 120,
                                          // color: Colors.red,
                                          child: FadeInImage.assetNetwork(
                                              height: 200,
                                              width: double.infinity,
                                              placeholder:
                                                  'assets/images/placeholder.png',
                                              placeholderFit: BoxFit.contain,
                                              image:
                                                  "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}",
                                              fit: BoxFit.contain),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 120),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (recentProductsList[index]
                                                        .isWhishlisted ==
                                                    true) {
                                                  DataManager.shared
                                                      .removeFromWishlist(
                                                          recentProductsList[
                                                              index]);
                                                  recentProductsList[index]
                                                      .isWhishlisted = false;
                                                } else {
                                                  DataManager.shared
                                                      .addToWishlist(
                                                          recentProductsList[
                                                              index]);
                                                  recentProductsList[index]
                                                      .isWhishlisted = true;
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: DataManager.shared
                                                      .iswishListed(
                                                          recentProductsList[
                                                              index])
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
                                        recentProductsList[index].prName ?? '',
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
                                        "QAR ${recentProductsList[index].unitPrice}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Intro',
                                            color: Colors.grey),
                                      ),
                                    ),
                                    if (recentProductsList[index]
                                        .isCartUpdateProgress!)
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
                                    if (recentProductsList[index]
                                            .isCartUpdateProgress ==
                                        false)
                                      Container(
                                        // width: 160,
                                        height: 30,
                                        child: recentProductsList[index]
                                                .isAddedtoCart()
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      DataManager.shared
                                                          .updateItemToCart(
                                                              recentProductsList[
                                                                  index],
                                                              4, onUpdate: () {
                                                        setState(() {});
                                                      }, onUpdateStarted: () {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff70726f),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
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
                                                        recentProductsList[
                                                                index]
                                                            .qty!
                                                            .toStringAsFixed(0),
                                                        style: TextStyle(
                                                            fontFamily: 'Intro',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      DataManager.shared
                                                          .updateItemToCart(
                                                              recentProductsList[
                                                                  index],
                                                              3, onUpdate: () {
                                                        setState(() {});
                                                      }, onUpdateStarted: () {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 40,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffe83031),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
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
                                                    backgroundColor:
                                                        (recentProductsList[
                                                                        index]
                                                                    .stockAvailability!
                                                                    .length ==
                                                                12)
                                                            ? Colors
                                                                .grey.shade300
                                                            : Colors.yellow),
                                                onPressed: () {
                                                  if (recentProductsList[index]
                                                          .stockAvailability!
                                                          .length !=
                                                      12)
                                                    // print(popularProductsList[
                                                    //         index]
                                                    //     .urlKey);

                                                    DataManager.shared
                                                        .updateItemToCart(
                                                            recentProductsList[
                                                                index],
                                                            1, onUpdate: () {
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
                                                  child: (recentProductsList[
                                                                  index]
                                                              .stockAvailability!
                                                              .length ==
                                                          12)
                                                      ? Text(
                                                          "OUT OF STOCK",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Intro',
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.grey
                                                                  .shade700),
                                                        )
                                                      : Text(
                                                          "ADD",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Intro',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                ),
                                              ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //     IndexedStack(
            //   index: selesctedindex,
            //   children: datas,
            // ),
          ],
        ),
      ),
      // ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),

                accountName: Text(
                  "Welcome User",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(""),
                // currentAccountPictureSize: Size.square(50),
                // currentAccountPicture: CircleAvatar(
                //   backgroundColor: Colors.grey,
                //   child: Text(
                //     "W",
                //     style: TextStyle(fontSize: 30.0, color: Colors.black),
                //   ), //Text
                // ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.free_cancellation),
              title: const Text("Shop By Category",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile ',
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text("My Wishlist",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("My Address",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text("Contact Us",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text("Privacy Policy",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Return Policy",
                  style: TextStyle(
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnPolicyScreen()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'LogOut',
                style: TextStyle(
                    fontFamily: 'Intro',
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginScreen();
                  },
                ), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

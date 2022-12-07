import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  List<TopCategories> categoryList = [];
  List<Product> featuredList = [];
  List<Product> popularProductsList = [];
  List<Product> recentProductsList = [];
  List<Product> relatedProductsList = [];
  List<MainBanner> bannerList = [];
  bool isLoading = true;
  String? cartItemId;

  Product? featuredProducts;

  @override
  void initState() {
    super.initState();
    getTopCategories();
    _featuredProducts();
    popularProducts();
    DataManager.shared.getWishList();
    recentProducts();
  }

  void getTopCategories() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .getTopCategories()
        .then((BaseResponse<List<TopCategories>> response) {
      print("1${response.data}");
      setState(() {
        isLoading = false;
        categoryList.clear();
        categoryList.addAll(response.data!);
        // print(response.data);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void _featuredProducts() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .featuredProducts()
        .then((BaseResponse<List<Product>> response) {
      // print(response.data);
      setState(() {
        isLoading = false;
        featuredList.clear();
        featuredList.addAll(response.data!);
        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void popularProducts() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .popularProducts()
        .then((BaseResponse<List<Product>> response) {
      DataManager.shared.getCart();
      // print(response.data);
      setState(() {
        isLoading = false;
        popularProductsList.clear();
        popularProductsList.addAll(response.data!);

        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void recentProducts() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .recentProducts()
        .then((BaseResponse<List<Product>> response) {
      // print(response.data);
      setState(() {
        isLoading = false;
        recentProductsList.clear();
        recentProductsList.addAll(response.data!);
        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void getBanners() {
    setState(() {
      isLoading = true;
    });
    NetworkManager.shared.getBanner(<String, dynamic>{
      "custId": NetworkManager.shared.userId,
      "guestId": "",
      "pincode": 8,
    }).then((BaseResponse<MainBanner> response) {
      setState(() {
        bannerList.clear();
        // bannerList.addAll(response.data.MainBanners);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("UserIdHome${NetworkManager.shared.userId}");

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
          IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => WishlistScreen()));
              getBanners();
            },
            icon: Icon(Icons.favorite_border),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Colors.red),
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
                                  color: Colors.grey.shade700),
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
              padding: const EdgeInsets.only(left: 8, right: 10),
              child: SizedBox(
                height: 160,
                child: isLoading
                    ? Center(child: LinearProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 125,

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
                                  // height: 150,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 100,
                                          width: 80,
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://dev.lenzcamera.com/webadmin/${categoryList[index].imageUrl}")),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          categoryList[index].catName ?? '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
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
              height: 700,
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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      isLoading
                          ? Center(child: LinearProgressIndicator())
                          : Container(
                              height: 630,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                      child: Card(
                                        shape: RoundedRectangleBorder(),
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 80),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (featuredList[
                                                                      index]
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
                                                        color: DataManager
                                                                .shared
                                                                .iswishListed(
                                                                    featuredList[
                                                                        index])
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      height: 100,
                                                      width: double.infinity,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                      ),
                                                      child: CachedNetworkImage(
                                                          imageUrl:
                                                              "https://dev.lenzcamera.com/webadmin/${featuredList[index].imageUrl}")),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                // 'CANON EF 16-35 MM F/4L IS USM',
                                                featuredList[index].prName ??
                                                    '',
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "QAR${featuredList[index].unitPrice}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 5),
                                              if (featuredList[index]
                                                  .isCartUpdateProgress!)
                                                SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    )),
                                              if (featuredList[index]
                                                      .isCartUpdateProgress ==
                                                  false)
                                                Container(
                                                  // width: 160,
                                                  height: 30,
                                                  child:
                                                      featuredList[index]
                                                              .isAddedtoCart()
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    DataManager.shared.updateItemToCart(
                                                                        featuredList[
                                                                            index],
                                                                        4,
                                                                        onUpdate:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    }, onUpdateStarted:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Color(0xff70726f),
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(5),
                                                                              bottomLeft: Radius.circular(5),
                                                                            )),
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
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
                                                                      child:
                                                                          Text(
                                                                    "1",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    DataManager.shared.updateItemToCart(
                                                                        featuredList[
                                                                            index],
                                                                        3,
                                                                        onUpdate:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    }, onUpdateStarted:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Color(0xffe83031),
                                                                            borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(5),
                                                                              bottomRight: Radius.circular(5),
                                                                            )),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 12,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  backgroundColor: (popularProductsList[index]
                                                                              .stockAvailability!
                                                                              .length ==
                                                                          12)
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .yellow),
                                                              onPressed: () {
                                                                // print(popularProductsList[
                                                                //         index]
                                                                //     .urlKey);

                                                                DataManager
                                                                    .shared
                                                                    .updateItemToCart(
                                                                        featuredList[
                                                                            index],
                                                                        1,
                                                                        onUpdate:
                                                                            () {
                                                                  setState(
                                                                      () {});
                                                                }, onUpdateStarted:
                                                                            () {
                                                                  setState(
                                                                      () {});
                                                                });
                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (context) =>
                                                                //             CartScreen()));
                                                              },
                                                              child: Center(
                                                                child: (featuredList[index]
                                                                            .stockAvailability ==
                                                                        12)
                                                                    ? Text(
                                                                        "Out of stock",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      )
                                                                    : Text(
                                                                        "ADD",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
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

            // SizedBox(height: 70),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
              ),
              itemCount: 4,
              // bannerList.length,
              itemBuilder: (BuildContext context, itemIndex, realIndex) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage("assets/images/logo_lenzcamera.png"),
                    )
                    // CachedNetworkImage(
                    // imageUrl:
                    //     "https://dev.lenzcamera.com/webadmin/${bannerList[itemIndex].MainBanners[index].imageUrl}"),
                    );
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 855,
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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      isLoading
                          ? Center(child: LinearProgressIndicator())
                          : Container(
                              height: 800,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                                    margin: EdgeInsets.only(
                                                        left: 125),
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
                                                            popularProductsList[
                                                                        index]
                                                                    .isWhishlisted =
                                                                false;
                                                          } else {
                                                            DataManager.shared
                                                                .addToWishlist(
                                                                    popularProductsList[
                                                                        index]);
                                                            popularProductsList[
                                                                        index]
                                                                    .isWhishlisted =
                                                                true;
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: DataManager
                                                                .shared
                                                                .iswishListed(
                                                                    popularProductsList[
                                                                        index])
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 145,
                                                    width: 110,
                                                    child: CachedNetworkImage(
                                                        imageUrl:
                                                            "https://dev.lenzcamera.com/webadmin/${popularProductsList[index].imageUrl}"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                // 'CANON EF 16-35 MM F/4L IS USM',
                                                popularProductsList[index]
                                                        .prName ??
                                                    '',
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                // 'QAR 120.00',
                                                "QAR${popularProductsList[index].unitPrice.toString()}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 5),
                                              if (popularProductsList[index]
                                                  .isCartUpdateProgress!)
                                                SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
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
                                                                    DataManager.shared.updateItemToCart(
                                                                        popularProductsList[
                                                                            index],
                                                                        4,
                                                                        onUpdate:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    }, onUpdateStarted:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Color(0xff70726f),
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(5),
                                                                              bottomLeft: Radius.circular(5),
                                                                            )),
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
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
                                                                      child:
                                                                          Text(
                                                                    "1",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    DataManager.shared.updateItemToCart(
                                                                        popularProductsList[
                                                                            index],
                                                                        3,
                                                                        onUpdate:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    }, onUpdateStarted:
                                                                            () {
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                      width: 30,
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(0xffe83031),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(5),
                                                                            bottomRight:
                                                                                Radius.circular(5),
                                                                          )),
                                                                      child: Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            12,
                                                                      )),
                                                                ),
                                                              ],
                                                            )
                                                          : ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  backgroundColor: (popularProductsList[index]
                                                                              .stockAvailability!
                                                                              .length ==
                                                                          12)
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .yellow),
                                                              onPressed: () {
                                                                // print(popularProductsList[
                                                                //         index]
                                                                //     .urlKey);
                                                                DataManager
                                                                    .shared
                                                                    .updateItemToCart(
                                                                        popularProductsList[
                                                                            index],
                                                                        1,
                                                                        onUpdate:
                                                                            () {
                                                                  setState(
                                                                      () {});
                                                                }, onUpdateStarted:
                                                                            () {
                                                                  setState(
                                                                      () {});
                                                                });
                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (context) =>
                                                                //             CartScreen()));
                                                              },
                                                              child: Center(
                                                                child: (popularProductsList[index]
                                                                            .stockAvailability!
                                                                            .length ==
                                                                        12)
                                                                    ? Text(
                                                                        "Out Of Stock",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.black),
                                                                      )
                                                                    : Text(
                                                                        "ADD",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
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

            isLoading
                ? Center(
                    child: LinearProgressIndicator(),
                  )
                : Container(
                    height: 300,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
                              child: Text(
                                'Recent Products',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 10),
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
                                        fontWeight: FontWeight.bold),
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
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                                  recentProductsList[index])));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(),
                                  elevation: 3,
                                  child: Column(
                                    children: [
                                      Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 10),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}"),
                                          ),
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
                                                color: (DataManager.shared
                                                        .iswishListed(
                                                            recentProductsList[
                                                                index]))
                                                    ? Colors.red
                                                    : Colors.grey,
                                              )),
                                        ),
                                      ]),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              recentProductsList[index]
                                                      .prName ??
                                                  '',

                                              // "CANON EF 16-35 MM F/4L IS USM ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      Text(
                                          "QAR${recentProductsList[index].unitPrice.toString()}",
                                          // "QAR 39999.00",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                      if (recentProductsList[index]
                                          .isCartUpdateProgress!)
                                        SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            )),
                                      if (recentProductsList[index]
                                              .isCartUpdateProgress ==
                                          false)
                                        Container(
                                          width: 160,
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
                                                                4,
                                                                onUpdate: () {
                                                          setState(() {});
                                                        }, onUpdateStarted: () {
                                                          setState(() {});
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
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
                                                          color: Colors.white,
                                                          size: 12,
                                                        )),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffe3e3e3),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        "1",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      )),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        DataManager.shared
                                                            .updateItemToCart(
                                                                recentProductsList[
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
                                                          height: 30,
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
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
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
                                                      child: Text(
                                                    "ADD",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )),
                                                ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )),
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
          padding: const EdgeInsets.all(0),
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
                  style: TextStyle(fontSize: 18),
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
              title: const Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.free_cancellation),
              title: const Text("Shop By Category"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text("My Wishlist"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("My Address"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text("Privacy Policy"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Return Policy"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnPolicyScreen()));
              },
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

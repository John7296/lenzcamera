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
import 'package:lenzcamera/model/user_location.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/category_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/explore_screen.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/location.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/popular_products_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/recent_product_screen.dart';
import 'package:lenzcamera/screens/return_policy_screen.dart';
import 'package:lenzcamera/screens/search_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';
import 'package:lenzcamera/widgets/appbar_notification_widget.dart';
import 'package:lenzcamera/widgets/drawer_widget.dart';
import 'package:lenzcamera/widgets/product_card_widget.dart';
import 'package:sizer/sizer.dart';

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
  List<Location> locationList = [];
  String? cartItemId;
  var _searchController = TextEditingController();
  String? search;
  String? selectedPlace;
  Product? featuredProducts;
  Product? products;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      getTopCategories();
      _featuredProducts();
      location(search ?? '');

      // _updateDeviceToken();
    });
    DataManager.shared.getWishList();
  }

  List<Location>? showCityList(String place) {
    List<Location> newLocationList = [];

    for (Location element in newLocationList) {
      if (element.place == place) {
        newLocationList.add(element);
      }
    }
    return newLocationList;
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
      NetworkManager.shared.guestId,
      NetworkManager.shared.pincodeId,
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

  void location(String search) {
    NetworkManager.shared
        .custLocation(search)
        .then((BaseResponse<List<Location>> response) {
      setState(() {
        locationList.clear();
        locationList.addAll(response.data!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("RegUserId${NetworkManager.shared.userId}");
    print("RegguestId${NetworkManager.shared.guestId}");
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            height: 80,
            width: 150,
            child: Image(
              image: AssetImage("assets/images/logo_lenzcamera_white.png"),
            ),
          ),
        ),
        actions: [
          AppBarNotificationWidget(),
        ],
        backgroundColor: Colors.grey.shade700,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
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
                      child: Icon(Icons.location_pin),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          // NetworkManager.shared.place,
                          (selectedPlace == '')
                              ? NetworkManager.shared.place
                              : selectedPlace ?? 'Doha',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10.sp),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(0.5.h),
                      child: TextButton(
                          onPressed: () {
                            // location(_searchController.text);
                            // showDialogue();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExploreScreen()));
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
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
                              margin: EdgeInsets.only(left: 1.h),
                              child: Icon(Icons.search_rounded,
                                  size: 3.h, color: Colors.grey.shade700),
                            ),
                            SizedBox(width: 3.h),
                            SizedBox(
                              child: Text(
                                "SEARCH PRODUCTS",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.h, right: 1.h),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  child: SizedBox(
                    height: 20.h,
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
              ),
              SizedBox(height: 1.5.h),
              Padding(
                padding: EdgeInsets.only(left: 0.5.h, right: 1.5.h),
                child: SizedBox(
                  height: 22.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.5.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchScreen()));
                              },
                              child: Container(
                                width: 15.h,
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
                                height: 20.h,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: FadeInImage.assetNetwork(
                                          height: 15.h,
                                          width: 25.w,
                                          placeholder:
                                              'assets/images/placeholder.png',
                                          placeholderFit: BoxFit.contain,
                                          image:
                                              "https://dev.lenzcamera.com/webadmin/${categoryList[index].imageUrl}",
                                          fit: BoxFit.contain),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        categoryList[index].catName ?? '',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
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
                height: 62.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
                      child: Row(
                        children: [
                          Text(
                            'Featured Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp),
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
                                  fontSize: 12.sp,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.h, right: 1.h),
                      child: Container(
                        height: 53.h,
                        // color: Colors.red,
                        child: StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          itemCount:
                              featuredList.length > 6 ? 6 : featuredList.length,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        featuredList[index]),
                                  ),
                                );
                              },
                              child: Container(
                                height: 26.h,
                                child: Card(
                                  // color: Colors.green,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(0.4.h),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 14.5.h,
                                              // color: Colors.red,
                                              child: FadeInImage.assetNetwork(
                                                  height: 200,
                                                  width: double.infinity,
                                                  placeholder:
                                                      'assets/images/placeholder.png',
                                                  placeholderFit:
                                                      BoxFit.contain,
                                                  image:
                                                      "https://dev.lenzcamera.com/webadmin/${featuredList[index].imageUrl}",
                                                  fit: BoxFit.contain),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              height: 3.5.h,
                                              // color: Colors.green,
                                              child: Text(
                                                featuredList[index].prName ??
                                                    '',
                                                maxLines: 2,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              height: 2.5.h,
                                              // color: Colors.yellow,
                                              child: Text(
                                                "QAR ${featuredList[index].unitPrice}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            if (featuredList[index]
                                                .isCartUpdateProgress!)
                                              Container(
                                                  // color:Colors.yellow,
                                                  height: 2.5.h,
                                                  width: 2.5.h,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child:
                                                        CircularProgressIndicator(
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
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              DataManager.shared
                                                                  .updateItemToCart(
                                                                      featuredList[
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
                                                              width: 30,
                                                              height: 25,
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
                                                            width: 50,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffe3e3e3),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                featuredList[
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
                                                                      featuredList[
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
                                                              width: 30,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                          0xffe83031),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
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
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0,
                                                            backgroundColor: (featuredList[
                                                                            index]
                                                                        .stockAvailability!
                                                                        .length ==
                                                                    12)
                                                                ? Colors.grey
                                                                    .shade300
                                                                : Colors
                                                                    .yellow),
                                                        onPressed: () {
                                                          if (featuredList[
                                                                      index]
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
                                                          child: (featuredList[
                                                                          index]
                                                                      .stockAvailability!
                                                                      .length ==
                                                                  12)
                                                              ? Text(
                                                                  "OUT OF STOCK",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Intro',
                                                                      fontSize:
                                                                          8,
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
                                                                      fontSize:
                                                                          10.sp,
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
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.white.withOpacity(0.5),
                                            radius: 2.h,
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
                                                        .isWhishlisted = false;
                                                  } else {
                                                    DataManager.shared
                                                        .addToWishlist(
                                                            featuredList[
                                                                index]);
                                                    featuredList[index]
                                                        .isWhishlisted = true;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 2.h,
                                                color: DataManager.shared
                                                        .iswishListed(
                                                            featuredList[index])
                                                    ? Colors.red
                                                    : Colors.grey,
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
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider.builder(
                        itemCount: bannerList.length,
                        itemBuilder: (context, itemIndex, realIndex) {
                          return InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                ),
                              );
                            }),
                            child: SizedBox(
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
                            ),
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
              // SizedBox(height: 10),
              Container(
                height: 105.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
                      child: Row(
                        children: [
                          Text(
                            'Popular Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp),
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
                                    fontSize: 12.sp),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            height: 75.h,
                            child: ProductCardWidget(
                                productsList: popularProductsList,
                                productsListCount:
                                    popularProductsList.length > 6
                                        ? 6
                                        : popularProductsList.length,
                                physics: NeverScrollableScrollPhysics())),
                      ],
                    )
                  ],
                ),
              ),
              if (recentProductsList.isNotEmpty)
                Container(
                  height: 40.h,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.sp),
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
                                      fontSize: 12.sp),
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70, left: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // shrinkWrap: true,
                          itemCount: recentProductsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        recentProductsList[index]),
                                  ),
                                );
                              }),
                              child: Container(
                                // height: 200.h,

                                width: 50.w,
                                child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 15.h),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (recentProductsList[
                                                                index]
                                                            .isWhishlisted ==
                                                        true) {
                                                      DataManager.shared
                                                          .removeFromWishlist(
                                                              recentProductsList[
                                                                  index]);
                                                      recentProductsList[index]
                                                              .isWhishlisted =
                                                          false;
                                                    } else {
                                                      DataManager.shared
                                                          .addToWishlist(
                                                              recentProductsList[
                                                                  index]);
                                                      recentProductsList[index]
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
                                                              recentProductsList[
                                                                  index])
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(1.h),
                                              child: Container(
                                                height: 100,
                                                width: 95,
                                                child: FadeInImage.assetNetwork(
                                                    height: 100,
                                                    width: 95,
                                                    placeholder:
                                                        'assets/images/placeholder.png',
                                                    placeholderFit:
                                                        BoxFit.contain,
                                                    image:
                                                        "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}",
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(height: 0.5.h),
                                        SizedBox(
                                          height: 3.5.h,
                                          child: Text(
                                            recentProductsList[index].prName ??
                                                '',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        SizedBox(
                                          height: 3.h,
                                          child: Text(
                                            // 'QAR 120.00',
                                            "QAR ${recentProductsList[index].unitPrice.toString()}",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        if (recentProductsList[index]
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
                                        if (recentProductsList[index]
                                                .isCartUpdateProgress ==
                                            false)
                                          Container(
                                            width: 160,
                                            height: 30,
                                            child:
                                                recentProductsList[index]
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
                                                                      recentProductsList[
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
                                                                recentProductsList[
                                                                        index]
                                                                    .qty!
                                                                    .toStringAsFixed(
                                                                        0),
                                                                style: TextStyle(
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
                                                                      recentProductsList[
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
                                                            backgroundColor: (recentProductsList[
                                                                            index]
                                                                        .stockAvailability!
                                                                        .length ==
                                                                    12)
                                                                ? Colors.grey
                                                                    .shade300
                                                                : Colors
                                                                    .yellow),
                                                        onPressed: () {
                                                          if (recentProductsList[
                                                                      index]
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
                                                          child: (recentProductsList[
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
            ],
          ),
        ),
      ),
      // ),
      drawer: DrawerWidget(),
    );
  }

  showDialogue() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Location> locationList = [];
        // return object of type Dialog
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Container(
              height: 35.h,
              // width: 50.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                          labelText: 'Search Location'),
                      controller: _searchController,
                      onChanged: (value) {
                        NetworkManager.shared
                            .custLocation(value)
                            .then((BaseResponse<List<Location>> response) {
                          locationList.clear();
                          locationList.addAll(response.data!);
                          setState(() {});
                        }).catchError((e) {
                          print(e.toString());
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  SizedBox(
                    height: 25.h,
                    width: 30.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount:
                          (locationList.isNotEmpty) ? locationList.length : 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              selectedPlace = locationList[index].place ?? '';

                              NetworkManager.shared.pincodeId =
                                  locationList[index].pincodeId!;
                              SessionsManager.saveUserPlace(
                                  locationList[index].place ?? '');

                              NetworkManager.shared.place =
                                  locationList[index].place!;

                              NetworkManager.shared.refreshTokens();

                              // print(
                              //     "pincode${NetworkManager.shared.pincodeId}");
                              // print(
                              //     "pincode${NetworkManager.shared.place}");
                              _searchController.clear();

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              (locationList.isNotEmpty)
                                  ? locationList[index].place ?? ''
                                  : NetworkManager.shared.place,
                              style: TextStyle(fontSize: 15),
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade700)),
                child: Text("close"),
                onPressed: () {
                  _searchController.clear();
                  Navigator.of(context).pop();
                  location(_searchController.text);
                },
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> _refreshPage() async {
    await Future.delayed(Duration(seconds: 1));
    getTopCategories();
    _featuredProducts();
    location(search!);
    DataManager.shared.getWishList();
    getBanners();
    popularProducts();
    recentProducts();
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/add_address.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/product_images.dart';
import 'package:lenzcamera/model/related_products.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/product_images_screen.dart';
import 'package:lenzcamera/screens/review_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/screens/write_review_screen.dart';
import 'package:lenzcamera/utils/constants.dart';
import 'package:lenzcamera/widgets/appbar_notification_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product? popularproducts;
  //  Product? relatedproducts;

  ProductDetailsScreen(
    @required this.popularproducts,
    //  this.relatedproducts
  );

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseStatefulState<ProductDetailsScreen> {
  List<Product> relatedproducts = [];

  List<ProductImages> productImages = [];

  bool isLoading = true;

  loadProgress() {
    if (isLoading == true) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), (() {
      getSingleProductDetails();
    }));
  }

  void getSingleProductDetails() {
    showLoader();
    NetworkManager.shared.getSingleProductDetails(<String, dynamic>{
      "custId": NetworkManager.shared.userId,
      'guestId': 0,
      'urlKey': widget.popularproducts?.urlKey,
      ' pincode': 8,
    }).then((BaseResponse<Product> response) {
      hideLoader();
      setState(() {
        relatedproducts.clear();
        relatedproducts.addAll(response.data!.relatedList!);

        productImages.clear();
        productImages.addAll(response.data!.productImages!);

        print("hhhhhhhhhhhhhhhhhhh");

        print(widget.popularproducts?.urlKey);

        print(response.data?.relatedList?.first.prName);
        print(response.data);
      });
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Product Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            actions: [
              AppBarNotificationWidget(),
            ],
            backgroundColor: kappBarColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            // centerTitle: true,
            // title: Text("Product Details"),
            // titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            // leading: IconButton(
            //   icon: const Icon(
            //     Icons.arrow_back_ios_new_sharp,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // backgroundColor: Colors.grey.shade700,
            // actions: [
            //   Stack(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => WishlistScreen()));
            //           // getBanners();
            //         },
            //         icon: Icon(Icons.favorite_border),
            //       ),
            //       if (DataManager.shared.wishListItems.isNotEmpty)
            //         Positioned(
            //           right: 5,
            //           top: 5,
            //           child: new Container(
            //             padding: EdgeInsets.all(2),
            //             decoration: new BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(6),
            //             ),
            //             constraints: BoxConstraints(
            //               minWidth: 14,
            //               minHeight: 14,
            //             ),
            //             child: Text(
            //               DataManager.shared.wishListItems.length.toString(),
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         )
            //     ],
            //   ),
            //   Stack(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => CartScreen()));
            //           // getBanners();
            //         },
            //         icon: Icon(Icons.shopping_cart),
            //       ),
            //       if (DataManager.shared.cartItemsList.isNotEmpty)
            //         Positioned(
            //           right: 5,
            //           top: 5,
            //           child: new Container(
            //             padding: EdgeInsets.all(2),
            //             decoration: new BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(6),
            //             ),
            //             constraints: BoxConstraints(
            //               minWidth: 14,
            //               minHeight: 14,
            //             ),
            //             child: Text(
            //               DataManager.shared.cartItemsList.length.toString(),
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         )
            //     ],
            //   ),
            //   // IconButton(
            //   //     onPressed: () {
            //   //       Navigator.push(
            //   //           context,
            //   //           MaterialPageRoute(
            //   //               builder: (context) => WishlistScreen()));
            //   //     },
            //   //     icon:
            //   //         Icon(Icons.favorite_border_outlined, color: Colors.white)),
            //   // SizedBox(width: 20),
            //   // IconButton(
            //   //     onPressed: () {
            //   //       Navigator.push(context,
            //   //           MaterialPageRoute(builder: (context) => CartScreen()));
            //   //     },
            //   //     icon: Icon(Icons.shopping_cart_outlined, color: Colors.white)),
            //   // SizedBox(width: 20),
            // ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              height: 200.0,
                              autoPlay: false,
                            ),
                            itemCount: productImages.length,
                            itemBuilder: (context, itemIndex, realIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductImagesScreen(
                                                    widget.popularproducts)));
                                  },
                                  child: FadeInImage.assetNetwork(
                                    height: 200,
                                    width: double.infinity,
                                    placeholder:
                                        'assets/images/placeholder.png',
                                    placeholderFit: BoxFit.contain,
                                    image:
                                        "https://dev.lenzcamera.com/webadmin/${productImages[itemIndex].imageUrl}",
                                    // fit: BoxFit.contain
                                  ),

                                  // CachedNetworkImage(
                                  //     imageUrl:
                                  //         "https://dev.lenzcamera.com/webadmin/${productImages[itemIndex].imageUrl}"),
                                ),
                              );
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductImagesScreen(
                                                      widget.popularproducts)));
                                    },
                                    icon: Icon(
                                      Icons.zoom_in_map,
                                      color: Color(0xff70706e),
                                    ))),
                          ),
                          // Center(
                          //     child: Container(
                          //   width: 200,
                          //   height: 160,
                          //   child: FadeInImage.assetNetwork(placeholder: "assets/images/lens.png",
                          //   image: "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl}"),

                          // CachedNetworkImage(imageUrl:
                          //                 "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl}"),
                          //
                          //
                          // Image(
                          //   image: AssetImage("assets/images/lens.png"),
                          // ),
                          // )),
                          Divider(
                            thickness: 5,
                            color: Color(0xffe3e3e3),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: 300,
                                    child: Text(
                                      widget.popularproducts!.prName.toString(),
                                      // "CANON EF 16-35MM F/2.8L III USM  ",
                                      style: TextStyle(
                                          color: Color(0xff70706e),
                                          fontSize: 20,
                                          fontFamily: 'Intro',
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 40),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (widget.popularproducts
                                                ?.isWhishlisted ==
                                            true) {
                                          DataManager.shared.removeFromWishlist(
                                              widget.popularproducts!);
                                          widget.popularproducts
                                              ?.isWhishlisted = false;
                                        } else {
                                          DataManager.shared.addToWishlist(
                                              widget.popularproducts!);
                                          widget.popularproducts
                                              ?.isWhishlisted = true;
                                        }
                                      });
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             WishlistScreen()));
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: DataManager.shared.iswishListed(
                                              widget.popularproducts)
                                          ? Colors.red
                                          : Color(0xff70706e),
                                    )),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            color: Color(0xffe3e3e3),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right:24, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 288,
                                      child: Text(
                                        widget.popularproducts
                                                ?.shortDescription ??
                                            '',
                                        // "Canon EF 16-35mm f/2.8L III USM Lens  ",
                                        style: TextStyle(
                                            color: Color(0xff70706e),
                                            fontSize: 10,
                                            fontFamily: 'Intro',
                                            wordSpacing: 2,
                                            height: 1.5,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 15,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          widget.popularproducts?.catName ?? '',
                                          // "DSLR Lenses",
                                          style: TextStyle(
                                              color: Color(0xff5aa567),
                                              fontSize: 10,
                                              fontFamily: 'Intro',
                                              fontWeight: FontWeight.w600),
                                        )),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: IconButton(
                                    //       onPressed: () {
                                    //         Share.share(
                                    //             "https://dev.lenzcamera.com/product/ ${widget.popularproducts?.urlKey ?? ''}");
                                    //       },
                                    //       icon: Icon(
                                    //         Icons.share,
                                    //         color: Color(0xff70706e),
                                    //       ),
                                    //     )),

                                    SizedBox(height: 25),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            "QAR ${widget.popularproducts?.unitPrice}",

                                            // "QAR 6899.00",
                                            style: TextStyle(
                                                color: Color(0xff70706e),
                                                fontSize: 17,
                                                fontFamily: 'Intro',
                                                fontWeight: FontWeight.w600))),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Share.share(
                                              "https://dev.lenzcamera.com/product/ ${widget.popularproducts?.urlKey ?? ''}");
                                        },
                                        icon: Icon(
                                          Icons.share,
                                          color: Color(0xff70706e),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // (widget.popularproducts?.IsReviewAvgrating!> 1)

                          Divider(
                            thickness: 5,
                            color: Color(0xffe3e3e3),
                          ),

                          //SizedBox(height: 5),

                          //       Divider(
                          //   thickness: 9,
                          //   color: Color(0xffe3e3e3),
                          // ),
                          if (widget.popularproducts?.IsReviewAvgrating != 0.0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        //height: 27,
                                        width: 85,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffec3436),
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReviewScreen(widget
                                                            .popularproducts)));
                                          },
                                          child: Text(
                                            "Reviews",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontFamily: "Intro",
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                          ),
                                        )),
                                  ),
                                ),
                                Divider(
                                  thickness: 9,
                                  color: Color(0xffe3e3e3),
                                ),
                              ],
                            ),

                          if (widget.popularproducts?.Reviewstatus != 0.0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        //height: 27,
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffec3436),
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WriteReviewScreen(widget
                                                            .popularproducts)));
                                          },
                                          child: Text(
                                            "Write Review",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.white,
                                                fontFamily: "Intro",
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                          ),
                                        )),
                                  ),
                                ),
                                // Divider(
                                //   thickness: 5,
                                //   color: Color(0xffe3e3e3),
                                // ),
                              ],
                            ),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 15, bottom: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Product Details",
                                        style: TextStyle(
                                            color: Color(0xff70706e),
                                            fontSize: 15,
                                            fontFamily: "Intro",
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                // SizedBox(height: 10),

                                // Padding(
                                //   padding: const EdgeInsets.only(left: 12),
                                //   child: Row(
                                //     children: [
                                //       Text("Key Features",
                                //           style: TextStyle(
                                //               color: Color(0xff6e706d),
                                //               fontSize: 13,
                                //               fontWeight: FontWeight.w300)),
                                //     ],
                                //   ),
                                // ),

                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Html(
                                    data: widget.popularproducts?.description ??
                                        "",
                                    style: {
                                      "body": Style(
                                        lineHeight: LineHeight.number(1.2),
                                        fontSize: FontSize(13.0),
                                        fontFamily: "Intro",
                                      ),
                                    },
                                    // "Key Features",
                                    // style: TextStyle(
                                    //     color: Color(0xff6e706d),
                                    //     fontSize: 13,
                                    //     fontWeight: FontWeight.w300),
                                    // maxLines: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 5,
                            color: Color(0xffe3e3e3),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Related Products",
                                  style: TextStyle(
                                      color: Color(0xff70706e),
                                      fontSize: 15,
                                      fontFamily: "Intro",
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                // left: 24, right: 24,
                                 top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 244,
                                        //color: Colors.green,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: relatedproducts.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetailsScreen(
                                                                  relatedproducts[
                                                                      index])));
                                                },
                                                child: Card(
                                                  child: Container(
                                                    width: 180,
                                                    // color: Colors.blue,
                                                    child: Column(
                                                      children: [
                                                        Stack(children: [
                                                          Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 18),
                                                              child: Container(
                                                                width: 100,
                                                                height: 110,
                                                                child: FadeInImage.assetNetwork(
                                                                    height: 200,
                                                                    width: double
                                                                        .infinity,
                                                                    placeholder:
                                                                        'assets/images/placeholder.png',
                                                                    placeholderFit:
                                                                        BoxFit
                                                                            .contain,
                                                                    image:
                                                                        "https://dev.lenzcamera.com/webadmin/${relatedproducts[index].imageUrl}",
                                                                    fit: BoxFit
                                                                        .contain),
                                                                //     CachedNetworkImage(
                                                                //   imageUrl:
                                                                //       "https://dev.lenzcamera.com/webadmin/${relatedproducts[index].imageUrl}",
                                                                //   fit: BoxFit
                                                                //       .fill,
                                                                // )

                                                                // Image(
                                                                //     image: AssetImage(
                                                                //         "assets/images/lens.png")),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (relatedproducts[index]
                                                                            .isWhishlisted ==
                                                                        true) {
                                                                      DataManager
                                                                          .shared
                                                                          .removeFromWishlist(
                                                                              relatedproducts[index]);
                                                                      relatedproducts[index]
                                                                              .isWhishlisted =
                                                                          false;
                                                                    } else {
                                                                      DataManager
                                                                          .shared
                                                                          .addToWishlist(
                                                                              relatedproducts[index]);
                                                                      relatedproducts[index]
                                                                              .isWhishlisted =
                                                                          true;
                                                                    }
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: DataManager
                                                                          .shared
                                                                          .iswishListed(relatedproducts[
                                                                              index])
                                                                      ? Colors
                                                                          .red
                                                                      : Color(
                                                                          0xff70706e),
                                                                )),
                                                          ),
                                                        ]),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10,
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Container(
                                                                height: 30,
                                                                child: Text(
                                                                  relatedproducts[
                                                                              index]
                                                                          .prName ??
                                                                      '',

                                                                  //  "CANON EF 16-35 MM F/4L IS USM ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontFamily:
                                                                          "Intro"),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )),
                                                        ),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 7),
                                                              child: Text(
                                                                  "QAR ${relatedproducts[index].unitPrice}",
                                                                  //  "QAR 39999.00",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          "Intro",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Color(
                                                                          0xff70706e))),
                                                            )),
                                                        SizedBox(height: 7),

                                                        if (relatedproducts[
                                                                index]
                                                            .isCartUpdateProgress!)
                                                          Container(
                                                              width: 160,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .yellow,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 75,
                                                                      right: 75,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        2,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )),
                                                        // SizedBox(
                                                        //     height: 10,
                                                        //     width: 10,
                                                        //     child:
                                                        //         CircularProgressIndicator(
                                                        //       strokeWidth: 2,
                                                        //       color: Colors.grey,
                                                        //     )),
                                                        if (relatedproducts[
                                                                    index]
                                                                .isCartUpdateProgress ==
                                                            false)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 10),
                                                            child: Container(
                                                              // width: 160,
                                                              height: 30,
                                                              child: relatedproducts[
                                                                          index]
                                                                      .isAddedtoCart()
                                                                  ? Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            DataManager.shared.updateItemToCart(relatedproducts[index], 4, onUpdate:
                                                                                () {
                                                                              setState(() {});
                                                                            }, onUpdateStarted:
                                                                                () {
                                                                              setState(() {});
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40,
                                                                            height:
                                                                                30,
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
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xffe3e3e3),
                                                                          ),
                                                                          child: Center(
                                                                              child: Text(
                                                                            relatedproducts[index].qty!.toStringAsFixed(0),
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          )),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            DataManager.shared.updateItemToCart(relatedproducts[index], 3, onUpdate:
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
                                                                              decoration: BoxDecoration(
                                                                                  color: Color(0xffe83031),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topRight: Radius.circular(5),
                                                                                    bottomRight: Radius.circular(5),
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
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        elevation:
                                                                            0,
                                                                        backgroundColor:
                                                                            Colors.yellow,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        DataManager.shared.updateItemToCart(
                                                                            relatedproducts[
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
                                                                      },
                                                                      child: Center(
                                                                          child: Text(
                                                                        "ADD",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Intro",
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.black),
                                                                      )),
                                                                    ),
                                                            ),
                                                          ),

                                                        //     .updateItemToCart(
                                                        //         relatedproducts[
                                                        //             index],
                                                        //         1, onUpdate: () {
                                                        //   setState(() {});
                                                        // }, onUpdateStarted: () {
                                                        //   setState(() {});
                                                        // });
                                                        //           // Navigator.push(
                                                        //           //     context,
                                                        //           //     MaterialPageRoute(
                                                        //           //         builder:
                                                        //           //             (context) =>
                                                        //           //                 CartScreen()));
                                                        //         },
                                                        //         child: Center(
                                                        //             child: Text(
                                                        //           "ADD",
                                                        //           style: TextStyle(
                                                        //               fontSize: 18,
                                                        //               color: Colors
                                                        //                   .black),
                                                        //         )),
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // if (widget.popularproducts?.isCartUpdateProgress == true)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
              //     child: Container(
              //         height: 40,
              //         decoration: BoxDecoration(
              //             color: Color(0xffec3436),
              //             borderRadius: BorderRadius.circular(5)),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 110, right: 110, top: 10, bottom: 10),
              //             child: CircularProgressIndicator(
              //               strokeWidth: 2,
              //             ),
              //           )
              //         )),
              //   ),
              //  if (widget.popularproducts?.isCartUpdateProgress == false)
              Padding(
                padding: const EdgeInsets.only(left: 24,right:24, bottom: 10),
                child: Container(
                  // width: 160,
                  height: 5.h,
                  //height: 40,
                  child: widget.popularproducts!.isAddedtoCart()
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // width: 23.h,
                              // height: 20.h,
                              height: 50,
                               width: 170,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffec3436),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go To Cart",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Intro",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Spacer(),

                            if (widget.popularproducts!.isCartUpdateProgress!)
                              Container(
                                  width: 140,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 65,
                                          right: 65,
                                          top: 10,
                                          bottom: 10),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),

                            // Spacer(),
                            if (widget.popularproducts!.isCartUpdateProgress ==
                                    false &&
                                widget.popularproducts!.isAddedtoCart())
                              Container(
                                  height: 30,
                                  width: 140,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              widget.popularproducts!, 4,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 30,
                                          // width: 40,
                                          // height: 30,
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
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xffe3e3e3),
                                        ),
                                        child: Center(
                                            child: Text(
                                          widget.popularproducts!.qty!
                                              .toStringAsFixed(0),
                                          style: TextStyle(color: Colors.black),
                                        )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              widget.popularproducts!, 3,
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
                                                bottomRight: Radius.circular(5),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 12,
                                            )),
                                      ),
                                    ],
                                  )),
                          ],
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: (widget.popularproducts!
                                          .stockAvailability?.length ==
                                      12)
                                  ? Colors.grey
                                  : Color(0xffec3436)),
                          onPressed: () {
                            DataManager.shared.updateItemToCart(
                                widget.popularproducts!, 1, onUpdate: () {
                              setState(() {});
                            }, onUpdateStarted: () {
                              setState(() {});
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: (widget.popularproducts!
                                            .stockAvailability?.length ==
                                        12)
                                    ? Text(
                                        "OUT OF STOCK",
                                        style: TextStyle(
                                            fontFamily: "Intro",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )
                                    : Text(
                                        "Add To Cart",
                                        style: TextStyle(
                                            fontFamily: "Intro",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                              ),
                              if (widget.popularproducts!.isCartUpdateProgress!)
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: SizedBox(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                    height: 12,
                                    width: 12,
                                  ),
                                ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
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

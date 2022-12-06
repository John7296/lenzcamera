import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/add_address.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/related_products.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/screens/write_review_screen.dart';

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

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  
  List<Product> relatedproducts = [];

  bool isLoading = true;


    @override
  void initState() {
    super.initState();
   getSingleProductDetails();
  }
  void getSingleProductDetails() {
    setState(() {
      isLoading = true;
    });

    // Map<String, dynamic> map = {
    //   "custId": 386,
    //   'guestId': 0,
    //   'urlKey': 'canon-lpe6nh-battery-og',
    //   ' pincode': 8,
    // };

    NetworkManager.shared
        .getSingleProductDetails(<String, dynamic>{
          "custId": NetworkManager.shared.userId,
        'guestId': 0,
        'urlKey': 'canon-lpe6nh-battery-og',
       ' pincode': 8,
  })
        .then((BaseResponse<ProductDetail> response) {
      setState(() {
        relatedproducts.clear();
        relatedproducts.addAll(response.data!.products!);
      });
    }).catchError((e) {
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
          title: Text("Product Details"),
          titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
               
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishlistScreen()));
                },
                icon:
                    Icon(Icons.favorite_border_outlined, color: Colors.white)),
            SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white)),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 65),
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 150.0,
                            autoPlay: false,
                          ),
                          itemCount: 2,
                          itemBuilder: (context, itemIndex, realIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl}"),
                              // FadeInImage.assetNetwork(
                              //   placeholder: 'assets/images/placeholder.jpg',
                              //   image: "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl??''}",
                              //   fit: BoxFit.cover),
                              //     Image(
                              //   image: AssetImage("assets/images/camerabanner.png"),
                              //   fit: BoxFit.fill,
                              //   width: MediaQuery.of(context).size.width,
                              // ),
                            );
                          },
                        ),
                        // Center(
                        //     child: Container(
                        //   width: 200,
                        //   height: 160,
                        //   child: FadeInImage.assetNetwork(placeholder: "assets/images/lens.png",
                        //   image: "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl}"),
            
                        //   // CachedNetworkImage(imageUrl:
                        //   //                 "https://dev.lenzcamera.com/webadmin/${widget.popularproducts?.imageUrl}"),
                        //   //
                        //   //
                        //   // Image(
                        //   //   image: AssetImage("assets/images/lens.png"),
                        //   // ),
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
                              Container(
                                width:300,
                                child: Text(
                                  widget.popularproducts!.prName.toString(),
                                  // "CANON EF 16-35MM F/2.8L III USM  ",
                                  style: TextStyle(
                                  color: Color(0xff6e706d),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                ),
                              ),

                              SizedBox(
                                width: 20,
                              ),
                               
                              IconButton(
                                  onPressed: () {
                                  
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WishlistScreen()));
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Color(0xff70726f),
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
                              left: 24, right: 24, top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.popularproducts?.shortDescription ??
                                    '',
                                // "Canon EF 16-35mm f/2.8L III USM Lens  ",
                                style: TextStyle(
                                    color: Color(0xff6e706d),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                maxLines: 8,
                              ),
                              SizedBox(height: 7),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.popularproducts?.catName ?? '',
                                    // "DSLR Lenses",
                                    style: TextStyle(
                                        color: Color(0xff5aa567),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500), 
                                  )),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                     print("hhhhhhhhhhhhhhh");
                                      // print(widget.popularproducts.);
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: Color(0xff70726f),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "QAR ${widget.popularproducts?.unitPrice}",
            
                                      // "QAR 6899.00",
                                      style: TextStyle(
                                          color: Color(0xff6e706d),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 9,
                          color: Color(0xffe3e3e3),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                //height: 27,
                                width: 80,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffec3436),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WriteReviewScreen()));
                                  },
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 9,
                          color: Color(0xffe3e3e3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 10, bottom: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Product Details",
                                      style: TextStyle(
                                          color: Color(0xff6e706d),
                                          fontSize: 15,
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
                                child: Text(
                                    widget.popularproducts?.description ?? "",
                                    // "Key Features",
                                    style: TextStyle(
                                        color: Color(0xff6e706d),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300)),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20, top: 30),
                              //   child: Row(
                              //     children: [
                              //       Text(". EF Mount Lens/ Full Frame Format",
                              //           style: TextStyle(
                              //               color: Color(0xff6e706d),
                              //               fontSize: 13,
                              //               fontWeight: FontWeight.w300)),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20, top: 5),
                              //   child: Row(
                              //     children: [
                              //       Text(". EF Mount Lens/ Full Frame Format",
                              //           style: TextStyle(
                              //               color: Color(0xff6e706d),
                              //               fontSize: 13,
                              //               fontWeight: FontWeight.w300)),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20, top: 5),
                              //   child: Row(
                              //     children: [
                              //       Text(". EF Mount Lens/ Full Frame Format",
                              //           style: TextStyle(
                              //               color: Color(0xff6e706d),
                              //               fontSize: 13,
                              //               fontWeight: FontWeight.w300)),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20, top: 5),
                              //   child: Row(
                              //     children: [
                              //       Text(". EF Mount Lens/ Full Frame Format",
                              //           style: TextStyle(
                              //               color: Color(0xff6e706d),
                              //               fontSize: 13,
                              //               fontWeight: FontWeight.w300)),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 20, top: 5, bottom: 5),
                              //   child: Row(
                              //     children: [
                              //       Text(". EF Mount Lens/ Full Frame Format",
                              //           style: TextStyle(
                              //               color: Color(0xff6e706d),
                              //               fontSize: 13,
                              //               fontWeight: FontWeight.w300)),
                              //     ],
                              //   ),
                              // ),
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
                                    color: Color(0xff6e706d),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
            
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 24, right: 24, top: 5),
                          child: Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 280,
            
                                        //color: Colors.green,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: relatedproducts.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                child: Container(
                                                  width: 200,
                                                  child: Column(
                                                    children: [
                                                      Stack(children: [
                                                        Center(
                                                          child: Container(
                                                              width: 150,
                                                              child: 
                                                              CachedNetworkImage(
                                                                  imageUrl:
                                                                      "https://dev.lenzcamera.com/webadmin/${relatedproducts[index].imageUrl}")
            
                                                              // Image(
                                                              //     image: AssetImage(
                                                              //         "assets/images/lens.png")),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 140),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                WishlistScreen()));
                                                              },
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xff70726f),
                                                              )),
                                                        ),
                                                      ]),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 10,
                                                                right: 10),
                                                        child: Align(
                                                            alignment:
                                                                Alignment.center,
                                                            child: Text(
                                                               relatedproducts[index].prName??'',
            
                                                             // "CANON EF 16-35 MM F/4L IS USM ",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              maxLines: 2,
                                                              textAlign: TextAlign
                                                                  .center,
                                                            )),
                                                      ),
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(top: 7),
                                                            child: 
                                                            Text(
                                                               "QAR ${ relatedproducts[
                                                                        index]
                                                                    .unitPrice}",
                                                                //  "QAR 39999.00",
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Container(
                                                          height: 35,
                                                          width: 200,
                                                          child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .yellowAccent,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CartScreen()));
                                                            },
                                                            child: Center(
                                                                child: Text(
                                                              "ADD",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, left: 24, right: 24),
                child: Container(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CartScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.popularproducts?.isAddedtoCart() == false)
                          Text(
                            "Add to Cart",
                            // widget.popularproducts?.isAddedtoCart() ?? false? "Add to Cart":"View Cart",
                            // ? ((int.parse(widget.popularproducts!.qty.toString()) > 0)
                            //     ? 'Add to Cart'
                            //     : 'Go to Cart'),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        if (widget.popularproducts?.isAddedtoCart() == true)
                          Text(
                            "Go to Cart",
                            // widget.popularproducts?.isAddedtoCart() ?? false? "Add to Cart":"View Cart",
                            // ? ((int.parse(widget.popularproducts!.qty.toString()) > 0)
                            //     ? 'Add to Cart'
                            //     : 'Go to Cart'),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),

                        // if (widget.popularproducts!.isAddedtoCart() ==false)
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10.0),
                        //   child: SizedBox(
                        //     child: CircularProgressIndicator(
                        //       strokeWidth: 2,
                        //       color: Colors.white,
                        //     ),
                        //     height: 12,
                        //     width: 12,
                        //   ),
                        // ),

                        //     Text(
                        //   "Add To Cart",
                        //   style: TextStyle(fontSize: 20, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

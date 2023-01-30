import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/details.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_review.dart';
import 'package:lenzcamera/model/review_details.dart';
import 'package:lenzcamera/model/review_response.dart';
import 'package:lenzcamera/utils/constants.dart';

import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  Product? products;
  ReviewScreen(this.products);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends BaseStatefulState<ReviewScreen> {
  double rating = 0.0;

   List<Details> review = [];

   List<ProductReview> prodrev = [];

  List<ReviewDetails> revdetails = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), (() {
      productReview();
    }));
  }

  // void productReview() {
  //   NetworkManager.shared
  //       .productReview(widget.products?.urlKey??'',
          
  //         NetworkManager.shared.userId,
          
  //       ).then((BaseResponse<ReviewResponse> response) {
  //     setState(() {
       
  //       revdetails.clear();
  //       revdetails.addAll(response.data!.reviewDetails!);

  //        review.clear();
  //       review.addAll(response.data!.details!);

  //      print(",,,,,,,,,,,,,,,,,");
  //     print(widget.products?.urlKey);
  //     print(response.data?.details?.first.reviewerEmail);
  //     });   
  //   }).catchError((e) {
  //    // hideLoader();
  //     print(e.toString());
  //   });
  // }


   void productReview() {
        showLoader();
    NetworkManager.shared
        .productReview(<String, dynamic>{
          
          "CustId": NetworkManager.shared.userId,
          "urlKey" : widget.products?.urlKey
          
        }).then((BaseResponse<ReviewResponse> response) {

          hideLoader();
      setState(() {
       
        revdetails.clear();
        revdetails.addAll(response.data!.reviewDetails!);

        // review.clear();
        // review.addAll(response.data!.details!);

       print(",,,,,,,,,,,,,,,,,");
      print(widget.products?.urlKey);
      print(response.data?.reviewDetails?.first.reviewerEmail);
      print(revdetails.length);

      // print(response.data?.details?.first.dateOfReview);
      });   
    }).catchError((e) {
      // hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reviews"),
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
        backgroundColor: kappBarColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white.withOpacity(0.85),
                ),
                child: Opacity(
                  opacity: 0.1,
                  // elevation: 5,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://dev.lenzcamera.com/webadmin/${widget.products?.imageUrl}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 210),
                child: Row(
                  children: [
                    Container(
                      width: 85.w,
                      child: Text(
                        widget.products?.prName ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 10),
                      child: Text("QAR ${widget.products?.unitPrice}",
                          // "QAR 600",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              )
            ]),

            //     Padding(
            //       padding: const EdgeInsets.only(left: 24),
            //       child: Row(

            //         children: [
            //           Container(
            //             child: Text(
            //               widget.products?.prName??'',
            //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            //               maxLines: 1,
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 24, top: 10),
            //       child: Text("QAR ${widget.products?.unitPrice}",
            //         // "QAR 600",
            //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            //     ),
            //   ],
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 30),
          child: Text("All Reviews",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20),
                  child: Text("4",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(" Out of 5",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only( top: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBarIndicator(
                        rating: 5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 20, height: 5, color: Colors.black),
                      Container(
                        width: 100,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: 3),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: 4,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 2, height: 5, color: Colors.black),
                      Container(
                        width: 118,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only( top: 3),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: 3,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 20, height: 5, color: Colors.black),
                      Container(
                        width: 100,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only( top: 3),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: 2,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 2, height: 5, color: Colors.black),
                      Container(
                        width: 118,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: 3),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: 1,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 2, height: 5, color: Colors.black),
                      Container(
                        width: 118,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 220, top: 5),
                      child: Text(
                        "${'2'} Reviews",
                        style: TextStyle(fontFamily: 'Intro'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Divider(
          indent: 24,
          endIndent: 24,
          color: Colors.grey[400],
          thickness: 2,
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 15.h,
                // color: Colors.green,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                  
                    itemCount: revdetails.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                             width: 380,
                            // color: Colors.green,
                            child: ListTile(
                              leading: Container(
                                child: CircleAvatar(
                                    backgroundColor: Color(0xffec3436)),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(revdetails[index].reviewerName??'',
                                    // "jibin_intertoons_QC",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Intro',
                                          fontWeight: FontWeight.w600)),
                                       Text("( ${revdetails[index].rating??''} )",
                              // textAlign: TextAlign.end,
                                //"(5)",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Intro',
                                    fontWeight: FontWeight.w600),),
                                     
                                ],
                              ),

                                  
                              subtitle: Text(revdetails[index].dateOfReview??'',
                                // "2022-09-15T12:02:16.25",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[400])),
                              // trailing: Text("( ${revdetails[index].rating??''} )",
                              // // textAlign: TextAlign.end,
                              //   //"(5)",
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       fontFamily: 'Intro',
                              //       fontWeight: FontWeight.w600),
                              // ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(revdetails[index].reviewDetails??'',
                              //"good product",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                    }),
              ),
            ),
          ],
        )
        // Padding(
        //   padding: const EdgeInsets.only(left: 24, top: 10),
        //   child: Row(
        //     children: [
        //       Container(
        //         child: CircleAvatar(backgroundColor: Color(0xffec3436)),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 20),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               children: [
        //                 Text("jibin_intertoons_QC",
        //                     style: TextStyle(
        //                         fontSize: 15,  fontWeight: FontWeight.w600)),
        //                 SizedBox(width: 100),
        //                 Text("(5)",
        //                     style: TextStyle(
        //                         fontSize: 15,  fontWeight: FontWeight.w600)),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               children: [
        //                 Text("15 Sept 2022",
        //                     style: TextStyle(
        //                         fontSize: 10,
        //                         fontWeight: FontWeight.w600,
        //                         color: Colors.grey[400])),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 24, top: 30),
        //   child: Text("good product",
        //       style: TextStyle(
        //           fontSize: 12,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.grey[400])),
        // )
      ]),
    );
  }
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

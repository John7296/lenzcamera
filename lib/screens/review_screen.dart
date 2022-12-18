import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/review_response.dart';

class ReviewScreen extends StatefulWidget {
  Product? products;
  ReviewScreen(this.products);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating = 0.0;

    @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), (() {
      productReview();
    }));
  }


 void productReview(){

     NetworkManager.shared.productReview(<String, dynamic>{
       "cusId": NetworkManager.shared.userId,
         "urlKey": widget.products?.urlKey
       }).then((BaseResponse<ReviewResponse> response) {

          //showFlashMsg(response.message!);

    
    //  Navigator.push(
    //                 context,
    //                   MaterialPageRoute(
    //                   builder: (context) =>
    //                   ReviewScreen()));
    }).catchError((Object obj) {
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
          backgroundColor: Colors.black,
        ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Container(
                child: Text(
                  widget.products?.prName??'',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 10),
              child: Text("QAR ${widget.products?.unitPrice}",
                // "QAR 600",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
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
                  child: Text("",
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top:20),
                  child: Row(
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
                      SizedBox(width: 5,),
                      Container(
                        width: 20,
                        height: 5,
                        color:Colors.black
                      ),
                      Container(
                        width: 100,
                        height: 5,
                        color:Colors.grey,
                      ),
                    ],
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.only(left: 60, top:3),
                  child: Row(
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
                      SizedBox(width: 5,),
                      Container(
                        width: 2,
                        height: 5,
                        color:Colors.black
                      ),
                      Container(
                        width: 118,
                        height: 5,
                        color:Colors.grey,
                      ),
                    ],
                  ),
                 ),
                  Padding(
                  padding: const EdgeInsets.only(left: 60, top:3),
                  child: Row(
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
                      SizedBox(width: 5,),
                      Container(
                        width: 20,
                        height: 5,
                        color:Colors.black
                      ),
                      Container(
                        width: 100,
                        height: 5,
                        color:Colors.grey,
                      ),
                    ],
                  ),
                  ),

                   Padding(
                  padding: const EdgeInsets.only(left: 60, top:3),
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
                      SizedBox(width: 5,),
                      Container(
                        width: 2,
                        height: 5,
                        color:Colors.black
                      ),
                      Container(
                        width: 118,
                        height: 5,
                        color:Colors.grey,
                      ),
                    ],
                  ),
                   ),
                    Padding(
                  padding: const EdgeInsets.only(left: 60, top:3),
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
                      SizedBox(width: 5,),
                      Container(
                        width: 2,
                        height: 5,
                        color:Colors.black
                      ),
                      Container(
                        width: 118,
                        height: 5,
                        color:Colors.grey,
                      ),
                    ],
                  ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 200, top: 5),
                        child: Text("2 Reviews"),
                      )
                    ],)
              ],
            ),
          ],
        ),

        Divider(
          indent: 24,
          endIndent: 24,
        ),

        Padding(
          padding: const EdgeInsets.only(left:24, top:10),
          child: Row(children: [
            Container(
              child: CircleAvatar(backgroundColor: Color(0xffec3436)),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    Text(
                     "jibin_intertoons_QC", 
                      style:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),

                                SizedBox(width:100),

                                 Text("(5)", style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 5,),

                Row(children: [
                  Text("15 Sept 2022", style:
                                TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey[400])),
                ],)
              ],),
            ),
          ],),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24,top:30 ),
          child: Text("good product",  style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[400])),
        )
      ]),
    );
  }
}

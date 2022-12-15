import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/review_screen.dart';

class WriteReviewScreen extends StatefulWidget{

Product? products;
 WriteReviewScreen(this.products);

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends BaseStatefulState<WriteReviewScreen> {

    double selectedRating = 5;
     final _reviewController = TextEditingController();
     final _reviewtitleController = TextEditingController();



     void addReview(){

     NetworkManager.shared.addReview(<String, dynamic>{
       "cusId": NetworkManager.shared.userId,
        "rating": selectedRating, 
        "review": _reviewController,
         "reviewtitle": _reviewtitleController.text, 
         "urlKey": "nikon-d850-dslr-cameraB305B4E"
       }).then((BaseResponse response) {

          showFlashMsg(response.message!);

    
     Navigator.push(
                    context,
                      MaterialPageRoute(
                      builder: (context) =>
                      ReviewScreen()));
    }).catchError((Object obj) {
    });


     }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
          centerTitle: true,
          title: Text("Write a Review"),
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

        body: SingleChildScrollView(
          child: Column(children: [
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Center(
                  child: Container(
            height: 200,
            width: 200,
              
                    child: CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${widget.products?.imageUrl}"),
                  ),
                ),
          
            Padding(
              padding: const EdgeInsets.only(left:24),
              child: Text(
               widget.products?.prName??'',
               // "GoPro Volta Battery Grip for HERO",
                style: TextStyle(fontSize: 20, fontFamily: 'Intro', fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          
                Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 10),
                child: Text("QAR ${widget.products?.unitPrice}",
                  
                  //"QAR 600",
               style: TextStyle(fontSize: 20, color: Color(0xff70706e),fontFamily: 'Intro',fontWeight: FontWeight.w600)),
              ),
            ],
          ),
              ],),
             
             Padding(
               padding: const EdgeInsets.only(left: 24, top: 15),
               child: Row(
                        children: [
                           RatingBar.builder(
                    itemSize: 35,
                    initialRating: selectedRating,
                   // minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    unratedColor: Color(0xffbec3c7),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xfff3f30d),
                    ),
                    onRatingUpdate: (rating) {
                      selectedRating = rating;
                    },
                  ),
                          // RatingBarIndicator(
                          //   rating: 5,
                          //   itemBuilder: (context, index) => Icon(
                          //     Icons.star,
                          //     color: Colors.grey,
                          //   ),
                          //   itemCount: 5,
                          //   itemSize: 30.0,
                          //   direction: Axis.horizontal,
                          // ),
                          
                        ],
                      ),
             ),
          
              Padding(
                padding: const EdgeInsets.only(left:24, right:24, top:20),
                child: Container(
                  height: 40,
                  child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff878787)),
                        ),
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.black, fontFamily: 'Intro',fontSize: 15, fontWeight: FontWeight.w500 ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          
                        ),
                      ),
                      controller: _reviewtitleController,
                      ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(left:24, right:24, top:20),
                child: TextField(
                  maxLines: 7,
                        decoration: InputDecoration(
                      hintText: "Write Your Review",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff878787)),
                      ),
                      
                      hintStyle: TextStyle(color: Colors.black, fontFamily: 'Intro',fontSize: 15, fontWeight: FontWeight.w500, ),
                      // 
                        
                      ),
                      controller: _reviewController,
                    ),
                ),
            
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top:5),
                    child: Text("Maximum 250 Characters", style: TextStyle(color: Color(0xff878787), fontSize: 10),),
                  ),
                ],
              ),
        
              Padding(
                padding: const EdgeInsets.only(left:24, right:24, top:20),
                child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {
        
                        addReview();
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) =>
                        // ReviewScreen()));
          
                      },
                      child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, fontFamily: 'Intro', fontWeight:FontWeight.w600, color: Colors.white),
                          )),
                    ),
                  ),
              ),       
          ],),
        )
   );
  }
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}
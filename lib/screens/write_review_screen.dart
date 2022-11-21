import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lenzcamera/screens/review_screen.dart';

class WriteReviewScreen extends StatefulWidget{
  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
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
            Stack(
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                 height: 200,
                 width: MediaQuery.of(context).size.width,
                   
                //  child: Image(image: AssetImage("assets/images/lens.png"),)
                ),
        
                 Padding(
                   padding: const EdgeInsets.only(left:24),
                   child: Text(
                     "GoPro Volta Battery Grip for HERO",
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
        
                Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 10),
                child: Text("QAR 600",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
              ],),
              ]
            ),
             
             Padding(
               padding: const EdgeInsets.only(left: 24, top: 15),
               child: Row(
                        children: [
                          RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                            itemCount: 5,
                            itemSize: 30.0,
                            direction: Axis.horizontal,
                          ),
                          
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
                        hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500 ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          
                        ),
                      ),
                      ),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.only(left:24, right:24, top:20),
                child: Expanded(
                  child: TextField(
                    maxLines: 7,
                          decoration: InputDecoration(
                        hintText: "Write Your Review",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff878787)),
                        ),
                        
                        hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500, ),
                        // 
                          
                        ),
                      ),
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
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                        ReviewScreen()));
          
                      },
                      child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ),
              ),       
          ],),
        )
   );
  }
}
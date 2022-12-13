import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/product_images.dart';
import 'package:lenzcamera/widgets/zoom_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:pinch_zoom/pinch_zoom.dart';


class ProductImagesScreen extends StatefulWidget {
  String urlKey;
  ProductImagesScreen(this.urlKey);
  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {
  TransformationController? controller;
  TapDownDetails? tapDownDetails;
  AnimationController? animationController;
  Animation<Matrix4>? animation;

  List<ProductImages> _productImages = [];





  void getSingleProductDetails() {
    NetworkManager.shared.getSingleProductDetails(<String, dynamic>{
      "custId": NetworkManager.shared.userId,
      'guestId': 0,
      'urlKey': widget.urlKey,
      ' pincode': 8,
    }).then((BaseResponse<ProductDetail> response) {
      setState(() {
        _productImages.clear();
        _productImages.addAll(response.data!.productImages!);

        
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getSingleProductDetails();
    // controller=TransformationController();
    // animationController = AnimationController(vsync: this, duration: Duration(milliseconds:300 ))
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  void onTapped(int index){

  _productImages[index];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Product Images"),
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
        ),
        body: Column(
          children: [

            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
             
                // Container(
                //   height: 200,
                //   width: 200,
                //   child: CachedNetworkImage(imageUrl: "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}",)
                // ),
              ],
            ),
            Expanded(
              
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height:200,
                //  color: Colors.green,
                margin: EdgeInsets.only(left: 0, right: 10),
                child: ListView.builder(
                    itemCount: _productImages.length,
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: 
                        () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ZoomImage(_productImages[index])));
                       },
                        child: Container(
                            
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(imageUrl: "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}")
                            
                        ),
                      );
                          
                    }),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildPinchModelList(ProductImages items, int index) {
  //   return Container(
  //     padding: EdgeInsets.only(top: 15.0, left: 15, right: 15),
  //     child: PinchZoom(
     
         
  //         child: CachedNetworkImage(imageUrl: "https://dev.lenzcamera.com/webadmin/${items.imageUrl}",),
        
      
  //       onZoomStart: () {
  //         print('Zoom started');
  //       },
  //       onZoomEnd: () {
  //         print('Zoom finished');
  //       },
  //     ),
  //   );
  }

                
                       
                       
                       
                    
                       
                   

            // Padding(
            //   padding: const EdgeInsets.only(top:70),
            //   child: Center(
            //     child: GestureDetector(
            //       child: Container(
            //         height: 290,
            //         width: 290,
                                      
            //         child: AspectRatio(
            //             aspectRatio: 1,
            //             child: PhotoView(
                          
            //                 //transformationController: controller,
            //                 imageProvider: AssetImage("assets/images/lens.png"),
                            
            //                 // NetworkImage("https://dev.lenzcamera.com/webadmin/${_productImages.first.imageUrl}") 
            //                 ),
                           
            //                 ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 200),
            // Container(
            //   height: 150,
            //   child:
               
            //       ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 2,
            //           itemBuilder: (BuildContext context, int index) {
            //             //  if(index == productImages?.productImages?.length)
            //             return GestureDetector(
            //               child: Padding(
            //                 padding:
            //                     EdgeInsets.only(left: 5.0, right: 5, top: 10),
            //                 child: Container(
            //                   height: 100.0,
            //                   width: 100.0,
            //                   child: Image(image: AssetImage("assets/images/lens.png"),
                              
            //                   // CachedNetworkImage(
            //                   //     imageUrl:
            //                   //         "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}"),
            //                 ),
            //               ),
            //               ),
            //             );
            //           }),
            // ),
          



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
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
  Product? products;
  ProductImagesScreen(this.products);
  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends BaseStatefulState<ProductImagesScreen> {


  List<ProductImages> _productImages = [];

  int? _index;

  void getSingleProductDetails() {
    showLoader();
    NetworkManager.shared.getSingleProductDetails(<String, dynamic>{
      "custId": NetworkManager.shared.userId,
      'guestId': 0,
      'urlKey': widget.products?.urlKey,
      ' pincode': 8,
    }).then((BaseResponse<Product> response) {
       hideLoader();
      setState(() {
        _productImages.clear();
        _productImages.addAll(response.data!.productImages!);

        print("hhhhhhhhhhhhhhhhhhhhhhhhh");
        print(widget.products?.urlKey);

          print(_productImages.length);
      
      });
    }).catchError((e) {
       hideLoader();
      print(e.toString());
    });
  }

  @override
  void initState() {
    super.initState();
   Future.delayed(Duration(milliseconds: 700), (() {
      getSingleProductDetails();
    }));
    _index == null;
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Product Images"),
          titleTextStyle: TextStyle(
              fontSize: 14, fontFamily: "Intro", fontWeight: FontWeight.w600),
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
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:100),
                    child: Container(
                      height: 300,
                       child:
                       PhotoView(imageProvider: 
                       CachedNetworkImageProvider("https://dev.lenzcamera.com/webadmin/${_productImages[_index ?? 0].imageUrl}"),
                        backgroundDecoration: BoxDecoration(color: Colors.transparent),
                       
                       ),
                      //  : Container(
                      //   height: 150,
                      //   width: 150,
                      //   child: Image(image: AssetImage("assets/images/lens.png"),
                      //   fit: BoxFit.fill,),
                      //  )
                      
                      //height: 300,
                     // width: 300,
              //           child: InteractiveViewer(
              //             scaleEnabled: true,
              //  clipBehavior: Clip.none,
              //           boundaryMargin: EdgeInsets.all(10.0),
              //         minScale: minScale,
              //         maxScale:4,
              //         onInteractionEnd: (details) {
              //            resetAnimation();
              //            },
                      // child: CachedNetworkImage(
                      //   imageUrl:
                      //       "https://dev.lenzcamera.com/webadmin/${_productImages[_index ?? 0].imageUrl}",
                      // ),
                    )
                        //  child: InteractiveViewer(

                        //    child: CachedNetworkImage(imageUrl: "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}"),),
                      //  ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 200,
                  //  color: Colors.green,
                  margin: EdgeInsets.only(left: 30, right: 10),
                  child: ListView.builder(
                      itemCount: _productImages.length,
                      scrollDirection: Axis.horizontal,
                    
                      //shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              width: 120,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _index = index;
    

                                  });
                                },
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    child: _productImages.isNotEmpty?
                                    
                                    CachedNetworkImage(
                                        imageUrl:
                                            "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}")
                                            : Image(image: AssetImage("assets/images/lens.png"),)
                                            )
                                            
                              ),
                            ),
                          ],
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
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }

}

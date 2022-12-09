import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/product_images.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
      'urlKey': widget..urlKey,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(top:70),
            child: Center(
              child: GestureDetector(
                child: Container(
                  height: 290,
                  width: 290,
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: PhotoView(
                          //transformationController: controller,
                          imageProvider:NetworkImage("https://dev.lenzcamera.com/webadmin/${_productImages.first.imageUrl}") )),
                ),
              ),
            ),
          ),
          SizedBox(height: 200),
          Container(
            height: 150,
            child:
             
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _productImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      //  if(index == productImages?.productImages?.length)
                      return GestureDetector(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5, top: 10),
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://dev.lenzcamera.com/webadmin/${_productImages[index].imageUrl}"),
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}

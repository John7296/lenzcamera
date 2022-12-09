import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_images.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductImagesScreen extends StatefulWidget{
  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {

   

     Product? productImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: Column(children: [

        Container(
    child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage("assets/images/lens.png"),
          // NetworkImage(""),
         initialScale: PhotoViewComputedScale.contained * 0.8,
        //  heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
        );
      },
       itemCount:2,
      // loadingBuilder: (context, event) => Center(
      //   child: Container(
      //     width: 20.0,
      //     height: 20.0,
      //     child: CircularProgressIndicator(
      //       value: event == null
      //           ? 0
      //           : event.cumulativeBytesLoaded 
      //           // / event.expectedTotalBytes,
      //     ),
      //   ),
      // ),
      // backgroundDecoration: widget.backgroundDecoration,
      // pageController: widget.pageController,
      // onPageChanged: onPageChanged,
    ),
        ),






      //  ListView.builder(
      // scrollDirection: Axis.horizontal,
      // itemCount: productImages?.productImages?.length,
      //   itemBuilder: (BuildContext context, int index){
      // //  if(index == productImages?.productImages?.length)
      //     return GestureDetector(
          
      //         child: Padding(
      //           padding: EdgeInsets.only(left:5.0, right:5,top: 10),
      //           child: Container(
      //             height: 100.0,
      //             width: 100.0,
      //             decoration: BoxDecoration(
      //               border: Border.all(),
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/add_pic.jpg'),
      //                 fit: BoxFit.fill,
      //               ),
      //               shape: BoxShape.rectangle,
      //             ),
      //           ),
      //         ),
      //      );
      
      //   }
      //  ),
    
      ],),
    );

  }
}
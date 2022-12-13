import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_images.dart';


class ZoomImage extends StatefulWidget{
 ProductImages? productimages;

 ZoomImage(this.productimages);

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
   return Container(
    height: 200,
    width: 200,
    child: CachedNetworkImage(imageUrl: "https://dev.lenzcamera.com/webadmin/${widget.productimages?.imageUrl}"),
            
   
   );
  }
}
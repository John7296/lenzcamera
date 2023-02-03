import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:sizer/sizer.dart';

class ProductCardWidget extends StatefulWidget {
  List<Product> productsList = [];
  int productsListCount;
  ScrollPhysics? physics;
  ProductCardWidget({
    super.key,
    required this.productsList,
    required this.productsListCount,
    this.physics,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 1.h),
      child: StaggeredGridView.countBuilder(
        physics: widget.physics,
        crossAxisCount: 2,
        itemCount: widget.productsListCount,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(widget.productsList[index]),
                ),
              );
            }),
            child: Card(
              // color: Colors.greenAccent,
              elevation: 1,
              shape: RoundedRectangleBorder(),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: FadeInImage.assetNetwork(
                                height: 100,
                                width: 100,
                                placeholder: 'assets/images/placeholder.png',
                                placeholderFit: BoxFit.fill,
                                image:
                                    "https://dev.lenzcamera.com/webadmin/${widget.productsList[index].imageUrl}",
                                fit: BoxFit.cover),
                          ),
                        ),
                        // SizedBox(height: 2.1.h),
                        SizedBox(
                          height: 3.5.h,
                          child: Text(
                            widget.productsList[index].prName ?? '',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          height: 2.5.h,
                          child: Text(
                            // 'QAR 120.00',
                            "QAR ${widget.productsList[index].unitPrice.toString()}",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (widget.productsList[index].isCartUpdateProgress!)
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                ),
                              )),
                        if (widget.productsList[index].isCartUpdateProgress ==
                            false)
                          Container(
                            width: 160,
                            height: 30,
                            child: widget.productsList[index].isAddedtoCart()
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              widget.productsList[index], 4,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xff70726f),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                          child: Center(
                                              child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 12,
                                          )),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xffe3e3e3),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.productsList[index].qty!
                                                .toStringAsFixed(0),
                                            style: TextStyle(
                                                fontFamily: 'Intro',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          DataManager.shared.updateItemToCart(
                                              widget.productsList[index], 3,
                                              onUpdate: () {
                                            setState(() {});
                                          }, onUpdateStarted: () {
                                            setState(() {});
                                          });
                                        },
                                        child: Container(
                                            width: 40,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffe83031),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                )),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 12,
                                            )),
                                      ),
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: (widget
                                                    .productsList[index]
                                                    .stockAvailability!
                                                    .length ==
                                                12)
                                            ? Colors.grey.shade300
                                            : Colors.yellow),
                                    onPressed: () {
                                      if (widget.productsList[index]
                                              .stockAvailability!.length !=
                                          12)
                                        // print(recentProductsList[
                                        //         index]
                                        //     .urlKey);
                                        DataManager.shared.updateItemToCart(
                                            widget.productsList[index], 1,
                                            onUpdate: () {
                                          setState(() {});
                                        }, onUpdateStarted: () {
                                          setState(() {});
                                        });
                                      // (widget.productsList[index].qoh ==
                                      //         widget.productsList[index].qty)
                                      //     ? Text(
                                      //         'Already reached Maximum Quantity..!')
                                      //     : DataManager.shared.cartItemsList;
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             CartScreen()));
                                    },
                                    child: Center(
                                      child: (widget.productsList[index]
                                                  .stockAvailability!.length ==
                                              12)
                                          ? Text(
                                              "OUT OF STOCK",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Intro',
                                                  color: Colors.grey.shade700),
                                            )
                                          : Text(
                                              "ADD",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Intro',
                                                  color: Colors.black),
                                            ),
                                    ),
                                  ),
                          ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 2.h,
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.productsList[index].IsWishlisted ==
                                  true) {
                                DataManager.shared.removeFromWishlist(
                                    widget.productsList[index]);
                                widget.productsList[index].IsWishlisted = false;
                              } else {
                                DataManager.shared
                                    .addToWishlist(widget.productsList[index]);
                                widget.productsList[index].IsWishlisted = true;
                              }
                              widget.productsList;
                              // DataManager.shared
                              //     .getWishList();
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 2.h,
                            color:
                                // widget.productsList[index].IsWishlisted!
                                DataManager.shared
                                        .iswishListed(widget.productsList[index])
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      ),
    );
  }
}

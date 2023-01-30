import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:sizer/sizer.dart';

class ViewAllPageWidget extends StatefulWidget {
  List<Product> productsList = [];

  ViewAllPageWidget(this.productsList);

  @override
  State<ViewAllPageWidget> createState() => _ViewAllPageWidgetState();
}

class _ViewAllPageWidgetState extends State<ViewAllPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.1.h, vertical: 0.1.h),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: widget.productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: .1.h, crossAxisSpacing: .1.h, crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(widget.productsList[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 14.h,
                            // color: Colors.red,
                            child: Center(
                              child: FadeInImage.assetNetwork(
                                  height: 20.h,
                                  width: 20.h,
                                  placeholder: 'assets/images/placeholder.png',
                                  placeholderFit: BoxFit.contain,
                                  image:
                                      "https://dev.lenzcamera.com/webadmin/${widget.productsList[index].imageUrl}",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            height: 3.5.h,
                            child: Text(
                              widget.productsList[index].prName ?? '',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: 2.h,
                            child: Text(
                              "QAR ${widget.productsList[index].unitPrice}",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          if (widget.productsList[index].isCartUpdateProgress!)
                            Container(
                                // color:Colors.yellow,
                                height: 4.h,
                                width: 5.w,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.grey,
                                  ),
                                )),
                          if (widget.productsList[index].isCartUpdateProgress ==
                              false)
                            Container(
                              // width: 160,
                              height: 4.h,
                              child: widget.productsList[index].isAddedtoCart()
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            width: 15.w,
                                            // height: 15.h,
                                            decoration: BoxDecoration(
                                                color: Color(0xff70726f),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
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
                                          width: 15.w,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xffe3e3e3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              widget.productsList[index].qty!
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
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
                                            width: 15.w,
                                            height: 4.h,
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
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: ElevatedButton(
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
                                            DataManager.shared.updateItemToCart(
                                                widget.productsList[index], 1,
                                                onUpdate: () {
                                              setState(() {});
                                            }, onUpdateStarted: () {
                                              setState(() {});
                                            });
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             CartScreen()));
                                        },
                                        child: Center(
                                          child: (widget
                                                      .productsList[index]
                                                      .stockAvailability!
                                                      .length ==
                                                  12)
                                              ? Text(
                                                  "OUT OF STOCK",
                                                  style: TextStyle(
                                                      fontSize: 1.5.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.grey.shade700),
                                                )
                                              : Text(
                                                  "ADD",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                        ),
                                      ),
                                    ),
                            ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.productsList[index].isWhishlisted ==
                                  true) {
                                DataManager.shared.removeFromWishlist(
                                    widget.productsList[index]);
                                widget.productsList[index].isWhishlisted =
                                    false;
                              } else {
                                DataManager.shared
                                    .addToWishlist(widget.productsList[index]);
                                widget.productsList[index].isWhishlisted = true;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 3.h,
                            color: DataManager.shared
                                    .iswishListed(widget.productsList[index])
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/model/single_order_detail.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/model/order_product_detail.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderList orderList;

  OrderDetailScreen(this.orderList);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BaseStatefulState<OrderDetailScreen> {
  List<OrderList> orderList = [];
  List<OrderProductDetail> singleItemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//     Future.delayed(Duration(milliseconds: 500), () {
// singleOrderDetail();
//     });
    singleOrderDetail();
  }

  void singleOrderDetail() {
    showLoader();
    NetworkManager.shared
        .orderDetails(widget.orderList.orderId!)
        .then((BaseResponse<SingleOrderDetail> response) {
      hideLoader();
      setState(() {
        singleItemList.clear();
        singleItemList.addAll(response.data!.OrderItemsDetails!);
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      hideLoader();
      print(e.toString());
    });
  }

  void cancelOrder() {
    // showLoader();
    NetworkManager.shared
        .cancelOrder(
      widget.orderList.orderId!,
      NetworkManager.shared.userId,
    )
        .then((BaseResponse response) {
      // hideLoader();
      showFlashMsg(response.message!);
      // Navigator.pop(context);
    }).catchError((e) {
      // showLoader();
      showFlashMsg(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Orders Details',
            style: TextStyle(
                fontFamily: 'Intro', fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.favorite_border),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ORDER DETAILS',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Intro'),
                          ),
                          Spacer(),
                          Text(
                            "#: ${widget.orderList.orderNumber ?? ''}",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Intro',
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status:${widget.orderList.status}',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Intro',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            // "",
                            'Payment Method: COD',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 15,
                          ),
                          Text('Delivery to',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Spacer(),
                          Text(
                            widget.orderList.orderDate ?? '',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              widget.orderList.Address.toString().replaceAll("\\n", " "),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: singleItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://dev.lenzcamera.com/webadmin/${singleItemList[index].imageUrl}",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Container(
                              width: 180,
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        singleItemList[index].prName ?? '',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "QAR${singleItemList[index].productPrice.toString()}",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('#ORD6195845655'),
                                  //       Spacer(),
                                  //       Text('Status:Order Placed',style: TextStyle(color: Colors.red),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sub Total:',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Intro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                              'QAR ${singleItemList.first.itemTotal.toString()}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Intro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping(+):',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Intro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                              'QAR ${singleItemList.first.itemTotal.toString()}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Intro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Total:',
                            style: TextStyle(
                                fontFamily: 'Intro',
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'QAR 3223.00',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Intro',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => OrderScreen()));
                  // cancelOrder();

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Are you sure want to cancel this order?",
                        style: TextStyle(fontSize: 15),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderScreen()));
                          },
                          child: Text('Cancel'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade400)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cancelOrder();
                            // Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderScreen()));
                          },
                          child: Text('Ok'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade400)),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'CANCEL ORDER',
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

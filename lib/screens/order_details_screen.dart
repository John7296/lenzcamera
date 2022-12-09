import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderList orderList;

  OrderDetailScreen(this.orderList);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BaseStatefulState<OrderDetailScreen> {
  List<OrderList> orderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            style: TextStyle(fontFamily: 'Roboto'),
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
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "#: ${widget.orderList.orderNumber ?? ''}",
                            style: TextStyle(fontSize: 12),
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
                            style: TextStyle(fontSize: 12),
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
                          Text('Delivery to', style: TextStyle(fontSize: 12)),
                          Spacer(),
                          Text(
                            widget.orderList.orderDate ?? '',
                            style: TextStyle(fontSize: 12),
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
                              widget.orderList.Address ?? '',
                              style: TextStyle(fontSize: 12),
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
                itemCount: orderList.length,
                itemBuilder: (BuildContext, context) {
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.orderList.Products ?? '',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
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
                                  fontSize: 12, fontFamily: 'Roboto')),
                          Spacer(),
                          Text('QAR 3198.00',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'Roboto')),
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
                                  fontSize: 12, fontFamily: 'Roboto')),
                          Spacer(),
                          Text('QAR 25.00',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'Roboto')),
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
                            style: TextStyle(fontFamily: 'Roboto'),
                          ),
                          Spacer(),
                          Text(
                            'QAR 3223.00',
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Roboto'),
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
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            cancelOrder();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderScreen()));
                          },
                          child: Text('Ok'),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
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

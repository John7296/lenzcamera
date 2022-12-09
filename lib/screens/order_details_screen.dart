import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/screens/home_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  // final OrderList orderList;
  const OrderDetailScreen(this.ProductImgUrl, this.orderNumber, this.status,
      this.orderDate, this.address, this.context);

  final String? orderNumber;
  final String? status;
  final String? ProductImgUrl;
  final String? orderDate;
  final String? address;
  final BuildContext? context;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BaseStatefulState<OrderDetailScreen> {
  List<OrderList> orderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      cusOrderList();
    });
  }

  void cusOrderList() {
    showLoader();
    NetworkManager.shared
        .getOrderList()
        .then((BaseResponse<List<OrderList>> response) {
      hideLoader();
      // print(response.data);
      setState(() {
        // isLoading = false;
        orderList.clear();
        orderList.addAll(response.data!);
        // print(response.data!.first.catId);
      });
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
      print(e.toString());
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
            Navigator.pop(context);
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ORDER DETAILS',
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Roboto'),
                          ),
                          Spacer(),
                          Text(
                            'Status:${widget.status}',
                            style: TextStyle(fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.orderNumber ?? ''),
                          Spacer(),
                          Text(
                            // "",
                            widget.status ?? '',
                            style: TextStyle(color: Colors.red),
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
                          Text(widget.orderDate ?? ''),
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
                              widget.address ?? '',
                              style: TextStyle(fontSize: 12),
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
                itemCount: 3,
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
                                  // Text('ORDER DETAILS',style: TextStyle(color: Colors.red),),
                                  //       Spacer(),
                                  //       Text('Status:Order Placed'),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/order_details_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends BaseStatefulState<OrderScreen> {
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
          child: Text('My Orders',style: TextStyle(fontFamily: 'Intro',fontWeight: FontWeight.bold,fontSize: 15),),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailScreen(orderList[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
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
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 5),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: 
                                               ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: 
                FadeInImage.assetNetwork(
                    height: 250,
                    width: double.infinity,
                    placeholder: 'assets/images/placeholder.png',
                    image: "https://dev.lenzcamera.com/webadmin/${orderList[index].ProductImgUrl}",
                    fit: BoxFit.cover),
              ),
                                          // CachedNetworkImage(
                                          //     imageUrl:
                                          //         "https://dev.lenzcamera.com/webadmin/${orderList[index].ProductImgUrl}"),
                                        )),
                                    Container(
                                      height: 16,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: (orderList[index]
                                                      .IsCanCancelOrder ==
                                                  false)
                                              ? Colors.red
                                              : Colors.grey.shade800),
                                      child: Center(
                                        child: (orderList[index]
                                                    .IsCanCancelOrder ==
                                                false)
                                            ? Text(
                                                'Cancelled',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : Text(
                                                'Placed',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 200,
                                child: Text(
                                  // 'CANON EF 16-35 MM F/4L IS USM',
                                  orderList[index].orderNumber ?? '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    orderList[index].ProductCount ?? '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' Item(s)',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Text(
                                    orderList[index].orderDate ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 25),
                                  child: Text(
                                      "QAR${orderList[index].orderAmount.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey.shade600)),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OrderDetailScreen(orderList[index]),
                                  ),
                                );
                              },
                              icon:
                                  Icon(Icons.arrow_forward, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

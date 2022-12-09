import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/cart_details.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/checkout_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends BaseStatefulState<CartScreen> {
  List<Product> cartItemsList = [];
  double? subtotal;
  double? grandtotal;
  double? deliveryamount;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      getCart();

      // DataManager.shared.getCart();
    });
  }

  void getCart() {
    showLoader();
    NetworkManager.shared
        .getCart(
      NetworkManager.shared.userId,
      0,
      8,
    )
        .then((BaseResponse<CartResponse> response) {
      hideLoader();
      setState(() {
        cartItemsList.clear();
        cartItemsList.addAll(response.data!.cartItems!);
        if (response.data!.cartItems!.first.subTotal != null) {
          subtotal = response.data!.cartItems!.first.subTotal;
        }

        if (response.data!.cartItems!.first.grandTotal != null) {
          grandtotal = response.data!.cartItems!.first.grandTotal;
        }

        if (response.data!.cartItems!.first.deliveryAmount != null) {
          deliveryamount = response.data!.cartItems!.first.deliveryAmount;
        }

        print(subtotal.toString());
        print(grandtotal.toString());
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff9f8f6),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cart"),
          titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          backgroundColor: Colors.grey.shade700,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              height: 600,
              color: Colors.grey.shade100,
              child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: cartItemsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://dev.lenzcamera.com/webadmin/${cartItemsList[index].imageUrl}"),
                                        )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 30,
                                        width: 180,
                                        child: Text(
                                          // 'CANON EF 16-35 MM F/4L IS USM',
                                          cartItemsList[index].prName ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        // 'QAR 8600.00',
                                        "QAR${cartItemsList[index].unitPrice}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              "Would you like to delete this item",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             CartScreen()));
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
                                                child: Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  DataManager.shared
                                                      .removeFromCart(
                                                          cartItemsList[index]);
                                                  getCart();
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.delete_outline,
                                          color: Colors.red),
                                    ),
                                    Spacer(),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 5, right: 5),
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  DataManager.shared
                                                      .updateItemToCart(
                                                    cartItemsList[index],
                                                    4,
                                                    onUpdate: () {
                                                      setState(() {});
                                                    },
                                                    onUpdateStarted: () {
                                                      setState(() {});
                                                    },
                                                  );
                                                  getCart();
                                                },
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff70726f),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(5),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                      )),
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 12,
                                                  )),
                                                ),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffe3e3e3),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  cartItemsList[index]
                                                      .qty
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  DataManager.shared
                                                      .updateItemToCart(
                                                    cartItemsList[index],
                                                    3,
                                                    onUpdate: () {
                                                      setState(() {});
                                                    },
                                                    onUpdateStarted: () {
                                                      setState(() {});
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffe83031),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 12,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Subtotal: ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                        // SizedBox(
                        //   width: 220,
                        // ),
                        Text(
                          "QAR ${subtotal.toString()}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Delivery: ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                        //  SizedBox(
                        //           width: 240,
                        //         ),
                        Text(
                          "QAR ${deliveryamount.toString()}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: Text(
                  //         "Discount: ",
                  //         style: TextStyle(
                  //             fontSize: 14, fontWeight: FontWeight.w500),
                  //       )),
                  //       //  SizedBox(
                  //       //           width: 240,
                  //       //         ),
                  //       Text(
                  //         "QAR ${cartItemsList.first.totalDiscount.toString()}",
                  //         style: TextStyle(
                  //             fontSize: 12, fontWeight: FontWeight.w500),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    "Total: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  )),
                  Text(
                    // "",
                    "QAR ${grandtotal.toString()}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Container(
              height: 50,
// width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff444444),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                              cartItemsList.first.grandTotal,
                              cartItemsList.first.subTotal,
                              context)));
                  getCart();
                },
                child: Center(
                    child: Text(
                  "PROCEED TO CHECKOUT",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
              ),
            ),
          ),
        ]));
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

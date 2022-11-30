import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/checkout_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cartItemsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  void _getCart() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared.getCart(<String, dynamic>{
      "custId": 386,
      "guestId": "",
      "pincode": 8,
      "productQty": 1,
    }).then((BaseResponse<CartResponse> response) {
      print(response.data?.cartItems);
      setState(() {
        // isLoading = false;
        // cartItemsList.clear();
        // cartItemsList.addAll(response.data!.cartItems!);
        
      });
    }).catchError((e) {
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 70),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.green,
                      ),
                      //color: Colors.green,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: 120,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                      height: 100,
                                                      child: Image(
                                                          image: AssetImage(
                                                              "assets/images/lens.png"))),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Stack(children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Container(
                                                          width: 200,
                                                          child: Expanded(
                                                            child: Text(
                                                                "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                maxLines: 2),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 220),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outlined,
                                                              color: Colors.red,
                                                            )),
                                                      ),
                                                    ]),
                                                    // SizedBox(width: 20),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("QAR 549.00",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        maxLines: 2),
                                                    SizedBox(
                                                      width: 90,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xff70726f),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                  )),
                                                          child: Center(
                                                              child: Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                            size: 12,
                                                          )),
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffe3e3e3),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                        ),
                                                        Container(
                                                            width: 30,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Color(
                                                                        0xffe83031),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5),
                                                                    )),
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            )),
                                                      ],
                                                    ),
                                                  
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Subtotal: ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                                // SizedBox(
                                //   width: 220,
                                // ),
                                Text(
                                  "QAR 549.00 ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Delivery: ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                                //  SizedBox(
                                //           width: 240,
                                //         ),
                                Text(
                                  "QAR 0.00 ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
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
                      height: 60,
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
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          )),

                          // SizedBox(
                          //               width: 240,
                          //             ),
                          Text(
                            "QAR 559.00 ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 40,
                  // width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff444444),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CheckoutScreen()));
                      _getCart();
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
                  //  onPressed: () {
                  //    Navigator.push(
                  //        context,
                  //        MaterialPageRoute(
                  //        builder: (context) =>
                  //        OrderScreen()));

                  //  },
                  //  child: Center(
                  //      child: Text(
                  //    "PROCEED TO CHECKOUT",
                  //    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                  //  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

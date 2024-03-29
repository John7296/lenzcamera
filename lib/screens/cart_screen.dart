import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash/flash.dart';
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
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/utils/constants.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  bool fromHome;

  CartScreen({this.fromHome = true});
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
      NetworkManager.shared.guestId,
      8,
    )
        .then((BaseResponse<CartResponse> response) {
      hideLoader();
      // showFlashMsg(response.message!);
      setState(() {
        cartItemsList.clear();
        cartItemsList.addAll(response.data!.cartItems!);
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
        titleTextStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            (widget.fromHome == true)
                ? Navigator.popUntil(context, (route) => route.isFirst)
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
            // Navigator.of(context).pop();
          },
        ),
        backgroundColor: kappBarColor,
      ),
      body: (cartItemsList.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 100.h,
                    color: Colors.grey.shade100,
                    child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount: cartItemsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 12.h,
                                  width: 100.h,
                                  //  height: 100,
                                  // width: 400,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15,
                                                right: 0.5.h,
                                                top: 2.h,
                                                bottom: 0.5.h),
                                            child: Container(
                                              height: 8.h,
                                              width: 10.h,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://dev.lenzcamera.com/webadmin/${cartItemsList[index].imageUrl}",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 2.h),
                                              child: Container(
                                                height: 5.h,
                                                width: 39.5.w,
                                                child: Text(
                                                  // 'CANON EF 16-35 MM F/4L IS USM',
                                                  cartItemsList[index].prName ??
                                                      '',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      // fontWeight: FontWeight.bold,
                                                      fontFamily: 'Intro'),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 15),
                                              child: Text(
                                                // 'QAR 8600.00',
                                                "QAR${cartItemsList[index].unitPrice}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Intro',
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text(
                                                      "Would you like to delete this item ?",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          // if (widget
                                                          //     .fromShowDialog)
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CartScreen())).then(
                                                              (value) {
                                                            getCart();
                                                          });
                                                          // Navigator.of(context)
                                                          //     .pop();
                                                          // Navigator
                                                          //     .pushAndRemoveUntil(
                                                          //         context,
                                                          //         MaterialPageRoute(
                                                          //   builder:
                                                          //       (BuildContext
                                                          //           context) {
                                                          //     return CartScreen();
                                                          //   },
                                                          // ),
                                                          //         (route) =>
                                                          //             false);
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .grey
                                                                        .shade400)),
                                                        child: Text('Cancel'),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          DataManager.shared
                                                              .removeFromCart(
                                                                  cartItemsList[
                                                                      index]);
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CartScreen())).then(
                                                              (value) {
                                                            getCart();
                                                          });

                                                          // Navigator
                                                          //     .pushAndRemoveUntil(
                                                          //         context,
                                                          //         MaterialPageRoute(
                                                          //   builder:
                                                          //       (BuildContext
                                                          //           context) {
                                                          //     return CartScreen();
                                                          //   },
                                                          // ), (route) => false);
                                                          // Navigator.pop(
                                                          // context);
                                                          // showFlashMsg(
                                                          //     "Item Removed Successfully");
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .grey
                                                                        .shade400)),
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
                                                  EdgeInsets.only(bottom: 8),
                                              // bottom: 5, right: 5
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            DataManager.shared
                                                                .updateItemToCart(
                                                              cartItemsList[
                                                                  index],
                                                              4,
                                                              onUpdate: () {
                                                                setState(() {});
                                                              },
                                                              onUpdateStarted:
                                                                  () {
                                                                setState(() {});
                                                              },
                                                            );
                                                            getCart();
                                                          },
                                                          child: Container(
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
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            )),
                                                          ),
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
                                                              cartItemsList[
                                                                      index]
                                                                  .qty!
                                                                  .toStringAsFixed(
                                                                      0),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Intro',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            DataManager.shared
                                                                .updateItemToCart(
                                                              cartItemsList[
                                                                  index],
                                                              3,
                                                              onUpdate: () {
                                                                setState(() {});
                                                              },
                                                              onUpdateStarted:
                                                                  () {
                                                                setState(() {});
                                                              },
                                                            );
                                                            (cartItemsList[index]
                                                                        .qoh ==
                                                                    cartItemsList[
                                                                            index]
                                                                        .qty)
                                                                ? showFlashMsg(
                                                                    'Already reached Maximum Quantity..!')
                                                                : getCart();
                                                          },
                                                          child: Container(
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
                                                                            Radius.circular(5),
                                                                        bottomRight:
                                                                            Radius.circular(5),
                                                                      )),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 12,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                    height: 8.h,
                    // height: 80,
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
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              // SizedBox(
                              //   width: 220,
                              // ),
                              if (cartItemsList.isNotEmpty)
                                Text(
                                  "QAR ${cartItemsList.first.subTotal.toString()}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              //  SizedBox(
                              //           width: 240,
                              //         ),
                              if (cartItemsList.isNotEmpty)
                                Text(
                                  "QAR ${deliveryamount ?? 0}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                    height: 5.h,
                    // height: 30,
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
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        if (cartItemsList.isNotEmpty)
                          Text(
                            // "",
                            "QAR ${cartItemsList.first.grandTotal.toString()}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Container(
                    height: 50,
// width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (NetworkManager.shared.userId == 0)
                            ? Colors.red
                            : Color(0xff444444),
                      ),
                      onPressed: () {
                        (NetworkManager.shared.userId == 0)
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(
                                      cartItemsList.first.grandTotal,
                                      cartItemsList.first.subTotal,
                                      context),
                                ),
                              );
                        getCart();
                      },
                      child: Center(
                          child: Text(
                        (NetworkManager.shared.userId == 0)
                            ? "Login"
                            : "PROCEED TO CHECKOUT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              height: 600,
              // width: 200,
              child: Image(
                image: AssetImage("assets/images/empty_cart.png"),
              ),
            ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

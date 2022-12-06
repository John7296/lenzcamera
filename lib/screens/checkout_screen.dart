import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/add_new_address_screen.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen(this.grandTotal, this.subTotal, this.context);
  final double? grandTotal;
  final double? subTotal;
  final BuildContext? context;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Product> cartItemsList = [];
  List<AddressList> addressList = [];
  bool umw = false;
  bool cod = false;
  AddressList? selectedAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address();
  }

  void address() {
    NetworkManager.shared
        .getAddressList()
        .then((BaseResponse<List<AddressList>> response) {
      setState(() {
        addressList.clear();
        addressList.addAll(response.data!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void placeOrder() {
    NetworkManager.shared.placeOrder(<String, dynamic>{
      "custBillAdressId": 295,
      "custId": 386,
      "custShipAdressId": 295,
      "orderNote": "Test",
      "payMethod": "COD",
    }).then((BaseResponse response) {
      // getCart(product: product);
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout"),
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
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(bottom: 65),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 130,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, right: 20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff717171),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                      "Delivery to",
                                      style: TextStyle(
                                          color: Color(0xff717171),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                                    SizedBox(width: 150),
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.0),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AddNewAddressScreen()));
                                                              },
                                                              child: Text(
                                                                "+Add New Address",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        14),
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                      indent: 10,
                                                      endIndent: 10,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 600,
                                                        color: Colors
                                                            .grey.shade100,
                                                        child: ListView.builder(
                                                            itemCount:
                                                                addressList
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    selectedAddress =
                                                                        addressList[
                                                                            index];
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 100,
                                                                    width: 400,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(10),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(addressList[index].firstName ?? ''),
                                                                              Text(addressList[index].lastName ?? ''),
                                                                              Text(addressList[index].addLine1 ?? ''),
                                                                              Text(addressList[index].addLine2 ?? ''),
                                                                              Text(addressList[index].country ?? ''),
                                                                              
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Spacer(),
                                                                        Column(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: () {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressScreen()));
                                                                              },
                                                                              icon: Icon(Icons.draw, color: Colors.grey),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () {
                                                                                // deleteAddress(addressList[index]);
                                                                              },
                                                                              icon: Icon(Icons.delete_outline, color: Colors.red),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                    )
                                                  ]);

                                              // ListView.builder(
                                              //     itemCount: addressList.length,
                                              //     itemBuilder:
                                              //         (BuildContext context,
                                              //             int index) {
                                              //       return Padding(
                                              //         padding:
                                              //             const EdgeInsets.all(
                                              //                 8.0),
                                              //         child: InkWell(
                                              //           onTap: () {
                                              //             selectedAddress =
                                              //                 addressList[
                                              //                     index];
                                              //             Navigator.pop(
                                              //                 context);
                                              //           },
                                              //           child: Container(
                                              //             height: 100,
                                              //             width: 400,
                                              //             decoration:
                                              //                 BoxDecoration(
                                              //               color: Colors.white,
                                              //               borderRadius:
                                              //                   BorderRadius
                                              //                       .all(Radius
                                              //                           .circular(
                                              //                               5)),
                                              //             ),
                                              //             child: Row(
                                              //               children: [
                                              //                 Padding(
                                              //                   padding:
                                              //                       const EdgeInsets
                                              //                           .all(10),
                                              //                   child: Column(
                                              //                     crossAxisAlignment:
                                              //                         CrossAxisAlignment
                                              //                             .start,
                                              //                     children: [
                                              //                       Text(addressList[index]
                                              //                               .firstName ??
                                              //                           ''),
                                              //                       Text(addressList[index]
                                              //                               .lastName ??
                                              //                           ''),
                                              //                       Text(addressList[index]
                                              //                               .addLine1 ??
                                              //                           ''),
                                              //                       Text(addressList[index]
                                              //                               .addLine2 ??
                                              //                           ''),
                                              //                       Text(addressList[index]
                                              //                               .country ??
                                              //                           ''),
                                              //                     ],
                                              //                   ),
                                              //                 ),
                                              //                 Spacer(),
                                              //                 Column(
                                              //                   children: [
                                              //                     IconButton(
                                              //                       onPressed:
                                              //                           () {
                                              //                         Navigator.push(
                                              //                             context,
                                              //                             MaterialPageRoute(
                                              //                                 builder: (context) => AddNewAddressScreen()));
                                              //                       },
                                              //                       icon: Icon(
                                              //                           Icons
                                              //                               .draw,
                                              //                           color: Colors
                                              //                               .grey),
                                              //                     ),
                                              //                   ],
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       );
                                              //     });
                                            }).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Text(
                                        "CHANGE",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 15),
                                child: Text(
                                  selectedAddress?.addLine1 ?? '',
                                  style: TextStyle(
                                      color: Color(0xff717171),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 5),
                                child: Text(
                                  selectedAddress?.addLine2 ?? '',
                                  style: TextStyle(
                                      color: Color(0xff717171), fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 5),
                                child: Text(
                                  addressList.first.country ?? '',
                                  style: TextStyle(
                                      color: Color(0xff717171), fontSize: 12),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 140,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, right: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff717171),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                      "Billing to",
                                      style: TextStyle(
                                          color: Color(0xff717171),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                                    SizedBox(width: 160),
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ListView.builder(
                                                  itemCount: addressList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          selectedAddress =
                                                              addressList[
                                                                  index];
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: 100,
                                                          width: 400,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(addressList[index]
                                                                            .firstName ??
                                                                        ''),
                                                                    Text(addressList[index]
                                                                            .lastName ??
                                                                        ''),
                                                                    Text(addressList[index]
                                                                            .addLine1 ??
                                                                        ''),
                                                                    Text(addressList[index]
                                                                            .addLine2 ??
                                                                        ''),
                                                                    Text(addressList[index]
                                                                            .country ??
                                                                        ''),
                                                                  ],
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Column(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => AddNewAddressScreen()));
                                                                    },
                                                                    icon: Icon(
                                                                        Icons
                                                                            .draw,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            }).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Text(
                                        "CHANGE",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 15),
                                child: Text(
                                  "Dhffig Yrfud",
                                  style: TextStyle(
                                      color: Color(0xff717171),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 5),
                                child: Text(
                                  "Dhffig Yrfud",
                                  style: TextStyle(
                                      color: Color(0xff717171), fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 44, top: 5),
                                child: Text(
                                  "Dhffig Yrfud",
                                  style: TextStyle(
                                      color: Color(0xff717171), fontSize: 12),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                value: umw,
                                onChanged: (value) {
                                  setState(() => umw = value!);
                                },
                                activeColor: Colors.red,
                                checkColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Use my wallet: 0",
                                style: TextStyle(
                                    color: Color(0xff717171), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    color: Color(0xff717171),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Choose Payment",
                                    style: TextStyle(
                                        color: Color(0xff717171),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 15),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      value: cod,
                                      onChanged: (value) {
                                        setState(() => cod = value!);
                                      },
                                      activeColor: Colors.red,
                                      checkColor: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Cash on Delivery",
                                      style: TextStyle(
                                          color: Color(0xff717171),
                                          fontSize: 12),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 165,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Color(0xff717171),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Cart Summary",
                                    style: TextStyle(
                                        color: Color(0xff717171),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 15, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Subtotal: ",
                                      style: TextStyle(
                                          color: Color(0xff717171),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),

                                    //  SizedBox(width: 160),
                                    Text(
                                      // "",
                                      "QAR ${widget.subTotal}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 20,
                                thickness: 0.75,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Total ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )),

                                    //  SizedBox(width: 175),
                                    Text(
                                      "QAR ${widget.grandTotal}",
                                      // "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 20,
                                thickness: 0.75,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: 170,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.note),
                                  SizedBox(width: 10),
                                  Text("Order Note",
                                      style: TextStyle(
                                          color: Color(0xff717171),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                maxLines: 3,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffec3436),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                    placeOrder();
                  },
                  child: Center(
                      child: Text(
                    "PLACE ORDER",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

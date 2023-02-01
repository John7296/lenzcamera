import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_details_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';
import 'package:lenzcamera/utils/constants.dart';

class OrderSuccessScreen extends StatefulWidget {
  OrderSuccessScreen();

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends BaseStatefulState<OrderSuccessScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Order Success',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          backgroundColor: kappBarColor,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/order_success.png'),
                      colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(1),
                        BlendMode.color,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Order Placed Successfully",
                  style: TextStyle(),
                ),
                SizedBox(height: 10),
                Text(
                  "Please check your Email, SMS",
                  style: TextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your Order Number:", style: TextStyle()),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderDetailScreen(orderList.first),
                          ),
                        );

                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        //   builder: (BuildContext context) {
                        //     return OrderDetailScreen(orderList[]);
                        //   },
                        // ), (route) => false);
                      },
                      child: Text(
                        NetworkManager.shared.orderNum.toString(),
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      // Text(orderList.first.orderNumber ?? '',style: TextStyle(color: Colors.red,  ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 300,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffec3436),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (BuildContext context) {
                                return HomeScreen();
                              },
                            ), (route) => false);
                          },
                          child: Center(
                              child: Text(
                            "CONTINUE SHOPPING",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //       builder: (BuildContext context) {
                    //         return HomeScreen();
                    //       },
                    //     ), (route) => false);
                    //   },
                    //   child: Text("Continue Shopping"),
                    // )),
                  ),
                )
              ],
            )
          ],
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

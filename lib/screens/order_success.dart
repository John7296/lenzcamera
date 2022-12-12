import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_details_screen.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen();

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
          child: Text('Order Success'),
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          SizedBox(height: 100),
          Text("Order Placed Successfully"),
          SizedBox(height: 50),
          Text("Please check your Email, SMS"),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Order Number:"),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => OrderDetailScreen(
                  //         orderList.first.ProductImgUrl ?? '',
                  //         orderList.first.orderId.toString(),
                  //         orderList.first.status ?? '',
                  //         orderList.first.orderDate ?? "",
                  //         context),
                  //   ),
                  // );
                },
                child: Text(orderList.first.orderNumber ?? ''),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 50,
                width: 300,
                // color: Colors.red,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomeScreen();
                      },
                    ), (route) => false);
                  },
                  child: Text("Continue Shopping"),
                )),
          )
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

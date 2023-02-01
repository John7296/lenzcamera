import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/widgets/appbar_notification_widget.dart';
import 'package:lenzcamera/widgets/product_card_widget.dart';
import 'package:sizer/sizer.dart';

class RecentProductsScreen extends StatefulWidget {
  const RecentProductsScreen({super.key});

  @override
  State<RecentProductsScreen> createState() => _RecentProductsScreenState();
}

class _RecentProductsScreenState
    extends BaseStatefulState<RecentProductsScreen> {
  List<Product> recentProductsList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _recentProducts();
    });
  }

  void _recentProducts() {
    showLoader();
    NetworkManager.shared
        .recentProducts()
        .then((BaseResponse<List<Product>> response) {
      hideLoader();
      setState(() {
        recentProductsList.clear();
        recentProductsList.addAll(response.data!);
        print(response.data!.first.catId);
      });
    }).catchError((e) {
      hideLoader();
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
            'Recent Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        actions: [
          AppBarNotificationWidget(),
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
      body: ProductCardWidget(
        productsList: recentProductsList,
        productsListCount: recentProductsList.length,
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

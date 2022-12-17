import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/category_screen.dart';
import 'package:lenzcamera/screens/change_password_screen.dart';
import 'package:lenzcamera/screens/checkout_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/screens/filter_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_details_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/reset_password_screen.dart';
import 'package:lenzcamera/screens/review_screen.dart';
import 'package:lenzcamera/screens/search_screen.dart';
import 'package:lenzcamera/screens/splash_screen.dart';
import 'package:lenzcamera/screens/write_review_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    },
  ));
  NetworkManager.shared.init();
}

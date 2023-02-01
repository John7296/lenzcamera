import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class AppBarNotificationWidget extends StatefulWidget {
  const AppBarNotificationWidget({super.key});

  @override
  State<AppBarNotificationWidget> createState() =>
      _AppBarNotificationWidgetState();
}

class _AppBarNotificationWidgetState extends State<AppBarNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
                // getBanners();
              },
              icon: Icon(Icons.favorite_border),
            ),
            if (DataManager.shared.wishListItems.isNotEmpty)
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(
                    DataManager.shared.wishListItems.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ],
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
                // getBanners();
              },
              icon: Icon(Icons.shopping_cart),
            ),
            if (DataManager.shared.cartItemsList.isNotEmpty)
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(
                    DataManager.shared.cartItemsList.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/category_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/screens/home_details_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/return_policy_screen.dart';
import 'package:lenzcamera/screens/search_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class HomeScreen extends StatefulWidget {
  final TopCategories? topCategories;

  const HomeScreen({Key? key, this.topCategories}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopCategories> categoryList = [];
  bool isLoading = false;

  int selectedindex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  // void goBack() {
  //   if (Navigator.canPop(context)) {
  //     Navigator.pop(context);
  //   } else {
  //     SystemNavigator.pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
            // pageChanged(index);
          },
          children: <Widget>[
            HomeDetailsScreen(),
            CategoryScreen(),
            CartScreen(),
            SearchScreen(),
            (NetworkManager.shared.userId == 0)
                ? LoginScreen()
                : ProfileScreen(),
          ],
        ),
      ),
      //  IndexedStack(index: selesctedindex, children: pages),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),

                accountName: Text(
                  "Welcome User",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(""),
                // currentAccountPictureSize: Size.square(50),
                // currentAccountPicture: CircleAvatar(
                //   backgroundColor: Colors.grey,
                //   child: Text(
                //     "W",
                //     style: TextStyle(fontSize: 30.0, color: Colors.black),
                //   ), //Text
                // ), //circleAvatar
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.free_cancellation),
              title: const Text("Shop By Category"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text("My Wishlist"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("My Address"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text("Privacy Policy"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Return Policy"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnPolicyScreen()));
              },
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                DataManager.shared.clearSession();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: selectedindex,
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.home_outlined),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: ImageIcon(
                  AssetImage("assets/images/ic_category.png"),
                  size: 20,
                ),
              ),
              label: "Category"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.shopping_cart_outlined),
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.search_outlined),
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.person_outline),
              ),
              label: "Profile"),
        ],
        selectedLabelStyle: TextStyle(),
        selectedFontSize: 12,
        unselectedLabelStyle: TextStyle(),
        unselectedFontSize: 12,
      ),
    );
  }

  void selectedPage(int index) {
    setState(() {
      selectedindex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}

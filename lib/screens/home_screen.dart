import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/category_menu_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/return_policy_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Lenz Camera'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(Icons.circle_outlined),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Doha',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search_rounded,
                              size: 30, color: Colors.grey.shade600),
                        ),
                        SizedBox(width: 30),
                        SizedBox(
                          child: Text(
                            "SEARCH PRODUCTS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                // color: Colors.amber,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber),
                    child: Image(
                    image: AssetImage("assets/images/camerabanner.png"),
                    fit: BoxFit.fill,
                    // width: MediaQuery.of(context).size.width,
                  ),
              ),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage("assets/images/lens.png"),
                                ),
                                // color: Colors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "CANON EF 16-35 MM F/4L IS USM ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
                height: 550,
                color: Colors.white,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Featured Products',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FeaturedProductsScreen()));
                              },
                              child: Text(
                                'View All ➜',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return
                              // Card(
                              //   semanticContainer: true,
                              //   clipBehavior: Clip.antiAliasWithSaveLayer,
                              //   child: Image.network(
                              //     'https://placeimg.com/640/480/any',
                              //     fit: BoxFit.fill,
                              //   ),
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //   ),
                              //   elevation: 5,
                              //   margin: EdgeInsets.all(10),
                              // );

                              Container(
                            height: 600,
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/lens.png"),
                                        height: 60,
                                        width: 50,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 80),
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  "Item Added to wishlist",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins'),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Color(0xff70726f),
                                          )),
                                    ),
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CANON EF 16-35 MM F/4L IS USM ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  Text("QAR 39999.00",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 5),
                                    child: Container(
                                      height: 20,
                                      width: 200,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.yellowAccent,
                                        ),
                                        onPressed: () {},
                                        child: Center(
                                            child: Text(
                                          "ADD",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
              ),
              itemCount: 4,
              itemBuilder: (context, itemIndex, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/images/camerabanner.png"),
                    fit: BoxFit.fill,
                    // width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Container(
                height: 900,
                color: Colors.white,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Popular Products',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FeaturedProductsScreen()));
                              },
                              child: Text(
                                'View All ➜',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 600,
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/lens.png"),
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  "Item Added to wishlist",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins'),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Color(0xff70726f),
                                          )),
                                    ),
                                  ]),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CANON EF 16-35 MM F/4L IS USM ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  Text("QAR 39999.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.yellowAccent,
                                      ),
                                      onPressed: () {},
                                      child: Center(
                                          child: Text(
                                        "ADD",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
            SizedBox(height: 50),
            Container(
                height: 320,
                color: Colors.white,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Recent Products',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FeaturedProductsScreen()));
                              },
                              child: Text(
                                'View All ➜',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 600,
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/lens.png"),
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  "Item Added to wishlist",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins'),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Color(0xff70726f),
                                          )),
                                    ),
                                  ]),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CANON EF 16-35 MM F/4L IS USM ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  Text("QAR 39999.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.yellowAccent,
                                      ),
                                      onPressed: () {},
                                      child: Center(
                                          child: Text(
                                        "ADD",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ), //BoxDecoration
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
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryMenuScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

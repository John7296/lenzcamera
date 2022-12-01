// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/change_password_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/edit_profile_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/order_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile? userProfile;
  LoginCustomer? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getProfile();
  }

  void getProfile() {
    setState(() {
      // isLoading = true;
    });

    NetworkManager.shared.getProfile().then((BaseResponse<Profile> response) {
      setState(() {
        userProfile = response.data;
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('My Profile'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
          backgroundColor: Colors.grey,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // color: Colors.amber,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(120, 50, 120, 50),
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 100,
                    ),
                  ),
                ),
                Text(userProfile?.custName ?? ''),
                Text(
                  userProfile?.emailId ?? '',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Personal"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Profile,phone,email"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.person),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {

                       print( user?.customerId);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChangePasswordScreen(user.customerId)));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Change Password"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Change your password"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.remove_red_eye),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen()));

                              },
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Address Book"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Add,Edit,Delete"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.location_city),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("My Orders"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("View,Track,Update"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.card_giftcard_outlined),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("My Wishlist"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("View,Update,Remove"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.favorite),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("My Wallet"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("View,Recharge"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.money),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsScreen()));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Support"),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Contact,Mail"),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.mail),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

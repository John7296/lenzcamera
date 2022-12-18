// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
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
import 'package:sizer/sizer.dart';

import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulState<ProfileScreen> {
  Profile? userProfile;
  LoginCustomer? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      getProfile();
    });
  }

  void getProfile() {
    showLoader();

    NetworkManager.shared.getProfile().then((BaseResponse<Profile> response) {
      hideLoader();
      setState(() {
        userProfile = response.data;
      });
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("My Profile"),
            titleTextStyle:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            backgroundColor: Colors.grey.shade700,
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WishlistScreen()));
                      // getBanners();
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  if (DataManager.shared.wishListItems.isNotEmpty)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                      // getBanners();
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  if (DataManager.shared.cartItemsList.isNotEmpty)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          DataManager.shared.cartItemsList.length.toString(),
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
            ],
          ),
          backgroundColor: Colors.grey.shade100,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              // color: Colors.amber,
              // height: 250,
               height: 35.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(120, 45, 120, 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                    child: Container(
                      height: 150,
                      width: 200,
                      child: Icon(
                        Icons.person_outline,
                        size: 100,
                      ),
                    ),
                  ),
                  Text(
                    userProfile?.custName ?? '',
                    style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Intro',fontSize: 10.sp),
                  ),
                  Text(
                    userProfile?.emailId ?? '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500,fontFamily: 'Intro',fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                   height: 600,
                  color: Colors.grey.shade100,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfileScreen())).then(((value) {
                            setState(() {
                              
                            });
                          }));
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
                                child: Text(
                                  "Personal",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Profile, phone, email",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.person),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                                  builder: (context) =>
                                      ChangePasswordScreen()));
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
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Change your password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.remove_red_eye),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                                child: Text("Address Book",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Add, Edit, Delete",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.location_city),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                                child: Text("My Orders",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("View, Track, Update",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.card_giftcard_outlined),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                                child: Text("My Wishlist",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("View, Update, Remove",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.favorite),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                          showFlashMsg('Wallet is Not Available');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditProfileScreen()));
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
                                child: Text("My Wallet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("View, Recharge",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.money),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  showFlashMsg('Wallet is Not Available');
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
                                child: Text("Support",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Contact, Mail",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                child: Icon(Icons.mail),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
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
                  )),
            )
          ]),
        ));
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

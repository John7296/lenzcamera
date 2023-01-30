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
import 'package:lenzcamera/utils/constants.dart';
import 'package:lenzcamera/widgets/appbar_notification_widget.dart';
import 'package:lenzcamera/widgets/profile_page_widget.dart';
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
      // showFlashMsg(response.message!);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Profile"),
        titleTextStyle: TextStyle(
          fontSize: kappBarColorFontSize.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        backgroundColor: kappBarColor,
        actions: [
          AppBarNotificationWidget(),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          // color: Colors.amber,
          // height: 250,
          height: 36.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(120, 43, 120, 10),
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
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
              ),
              Text(
                userProfile?.emailId ?? '',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp),
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
                                    builder: (context) => EditProfileScreen()))
                            .then(((value) {
                          setState(() {});
                        }));
                      }),
                      child: ProfilePageWidget('Personal',
                          'Profile, phone, email', Icon(Icons.person))),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen()));
                      }),
                      child: ProfilePageWidget('Change Password',
                          'Change your password', Icon(Icons.remove_red_eye))),
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
                      child: ProfilePageWidget('Address Book',
                          'Add, Edit, Delete', Icon(Icons.location_city))),
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
                      child: ProfilePageWidget(
                          "My Orders",
                          'View, Track, Update',
                          Icon(Icons.card_giftcard_outlined))),
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
                      child: ProfilePageWidget('My Wishlist',
                          'View, Update, Remove', Icon(Icons.favorite))),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: (() {
                        showFlashMsg('Wallet is Not Available');
                      }),
                      child: ProfilePageWidget(
                          'My Wallet', 'View, Recharge', Icon(Icons.money))),
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
                      child: ProfilePageWidget(
                          'Support', 'Contact, Mail', Icon(Icons.mail))),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
        ),
      ]),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

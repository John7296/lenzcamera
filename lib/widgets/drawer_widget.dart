import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/category_screen.dart';
import 'package:lenzcamera/screens/contact_us_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/screens/return_policy_screen.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Profile? userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() {
    // showLoader();

    NetworkManager.shared.getProfile().then((BaseResponse<Profile> response) {
      // hideLoader();
      setState(() {
        userProfile = response.data;
      });
    }).catchError((e) {
      // hideLoader();
      // showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              accountName: Text(
                "Welcome ${userProfile?.custName ?? ''}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            title: const Text("Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.free_cancellation),
            title: const Text("Shop By Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.favorite_border_outlined),
            title: const Text("My Wishlist",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("My Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddressScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Contact Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.tab_outlined),
            title: const Text("Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("Return Policy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReturnPolicyScreen()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log out',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            onTap: () {
              SessionsManager.clearSession();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return LoginScreen();
                },
              ), (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

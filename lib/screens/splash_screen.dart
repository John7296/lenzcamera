import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => {
        _checkTokenAndNavigate(),
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()))
      },
    );
    super.initState();
  }

  void _checkTokenAndNavigate() {
    //     SessionsManager.getUserToken().then((utoken) {
    //      utoken = (utoken ?? "");
    //       NetworkManager.shared.userKey =
    //           utoken.isEmpty ? "" : "Bearer $utoken";
    //       Timer(const Duration( seconds:2 ), () {
    //     //        Navigator.push(
    //     //   context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    //  // print(SessionsManager.userToken);

    SessionsManager.getUserToken().then((value) {
      print("///////");
      print(value);

      if ((value ?? "").isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });

    // if(SessionsManager.userToken.isNotEmpty){

    //    Navigator.push(
    //   context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    // }

    // else{
    //  Navigator.push(
    //   context, MaterialPageRoute(builder: (context)=>LoginScreen()));

    // }
    // SessionsManager.isLoggedIn().then((value) {
    //   if (value) {
    //      Navigator.push(
    //        context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    //   } else {
    //     Navigator.push(
    //       context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    //   }

    // });
    // });
    //       });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 350,
            child: Image(
              image: AssetImage("assets/images/logo_lenzcamera.png"),
            ),
          ),
        ),
      ),
    );
  }
}

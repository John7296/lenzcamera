import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>LoginScreen()))

    );
    super.initState();

    // NetworkManager.shared.getTopCategories().then((value) {


    // }).catchError((e){});
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/screens/explore_screen.dart';
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
    NetworkManager.shared.refreshTokens();

    Timer(
      Duration(seconds: 3),
      () => {
        _checkTokenAndNavigate(),
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()))
      },
    );
    super.initState();
  }

  void _checkTokenAndNavigate() { 
  
    SessionsManager.getUserToken().then((value) {
      // print("///////");
      print(value);

      if ((value ?? "").isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ExploreScreen()));
      }
    });

    
    
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

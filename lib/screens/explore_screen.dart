import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  void guestId() {
    int min = 0;
    int max = 100;

    int randomnum = min + Random().nextInt((max + 1) - min);

    NetworkManager.shared.guestId = randomnum;
    SessionsManager.saveGuestId(randomnum);

    NetworkManager.shared.refreshTokens();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
    print("guestId${NetworkManager.shared.guestId}");

    print("Generated Random number between $min and $max is: $randomnum");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Center(
                child: Container(
                  width: 300,
                  child: Image(
                    image: AssetImage("assets/images/logo_lenzcamera.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffec3436),
                ),
                onPressed: () {
                  guestId();
                },
                child: Center(
                    child: Text(
                  "Explore",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF444444),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Center(
                    child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class ExploreScreen extends StatefulWidget{
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children:[
              Padding(
                padding: const EdgeInsets.only(top:250),
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
                        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Center(
                          child: Text(
                        "Explore",
                        style: TextStyle(fontSize: 20, fontFamily: 'Intro', fontWeight: FontWeight.w600, color: Colors.white),
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
                        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                      },
                      child: Center(
                          child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20, fontFamily: 'Intro', fontWeight: FontWeight.w600, color: Colors.white),
                      )),
                    ),
                  ),
          ]
          
        ),
      ),
     ),
    );
  }
}
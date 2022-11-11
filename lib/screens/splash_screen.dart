import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // Timer(Duration(seconds: 3), ()=>
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context)=>LoginScreen()))
    //
    // );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: Center(child:
     Container(
      width: 350,
       child:  Image(image: AssetImage("assets/lenzcamera.png"),
     ),
    ),
     ),
   );
  }
}
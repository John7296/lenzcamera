import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatefulWidget{
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Forgot Password"),
          titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          backgroundColor: Color(0xff474747),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(height: 200),
              Center(
                child: Container(
                    width: 220,
                    child: Image(image: AssetImage("assets/lenzcamera.png"))),
              ),
              SizedBox(height: 50),
             OtpTextField(
             numberOfFields: 5,
               enabledBorderColor: Color(0xffce443a),
               focusedBorderColor: Color(0xff474747),
               showFieldAsBox: true,
               fieldWidth: 60
             ),
              SizedBox(height: 55),
              Container(
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffec3436),
                  ),
                  onPressed: () {},
                  child: Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
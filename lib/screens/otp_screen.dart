import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lenzcamera/screens/change_password_screen.dart';
import 'package:lenzcamera/screens/reset_password_screen.dart';


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
            onPressed: () {
                Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff474747),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 200),
                Center(
                  child: Container(
                      width: 220,
                      child: Image(image: AssetImage("assets/images/logo_lenzcamera.png"))),
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
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {

                       Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                    },
                    child: Center(
                        child: Text(
                          "Submit OTP",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
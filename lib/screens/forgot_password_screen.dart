import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/otp_screen.dart';
import 'package:lenzcamera/screens/verify_forgot_pwd_otp_screen.dart';
import 'package:lenzcamera/utils/helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _emailController = TextEditingController();

   bool emailSent = false;
  bool isMobileNumber = false;



   void forgotPasswordOTPSend() {

     Map<String, dynamic> map = {
      'email': _emailController.text,
      'mobile': ""
    };
   
    NetworkManager.shared.forgotPasswordOTPSend(map).then((BaseResponse response) {

      debugPrint("Reshma Sathyan");
      // hideLoader();
      setState(() {
        emailSent = true;
      });
       Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      verifyForgotPwddOtpScreen()));
     
    }).catchError((Object obj) {
    });
  }

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
          backgroundColor: Colors.black,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email Or Mobile Number",
                    style: TextStyle(
                        color: Color(0xff747474),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 40,
                  child: TextFormField(
                     enabled: !emailSent,
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                  ),
                   controller: _emailController,
                                    validator: (val) {
                                      if (isMobileNumber) {
                                        if (val!.isEmpty)
                                          return "Enter Mobile/Email";
                                      } else {
                                        if (!Helper.validateEmail(val!)) {
                                          return "Please enter a valid email";
                                        }
                                      }

                                      return null;
                                    }
                  
                  
                  
                  
                  ),
                ),
                SizedBox(height: 25),
              
                Container(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {

                      //  if (emailSent) {
                          forgotPasswordOTPSend();
                      //  }
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      // builder: (context) =>
                      // OtpScreen()));
          
                    },
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
      ),
    );
  }
}

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyForgotPwddOtpScreen extends StatefulWidget{

// BaseResponse? response;
//  verifyForgotPwddOtpScreen(this.response);
VerifyForgotPwddOtpScreen(this.data);
String data;

  @override
  State<VerifyForgotPwddOtpScreen> createState() => _VerifyForgotPwddOtpScreenState();
}

class _VerifyForgotPwddOtpScreenState extends State<VerifyForgotPwddOtpScreen> {

    final _otpController = TextEditingController();
     bool emailSent = false;
     
 void showFlashMsg(String msg, {Color color = const Color(0xFF272532)}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[2],
         // backgroundColor: Colors.grey,
          reverseAnimationCurve: Curves.easeInCirc,
          forwardAnimationCurve: Curves.easeInOutBack,
          margin: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(6.0),    
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              msg,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
    
  void verifyForgotPasswordOtp() {
    NetworkManager.shared.verifyForgotPasswordOTP(<String, dynamic>{
      "OTP": _otpController.text,
      "OtpUrlKey":widget.data,
    }).then((BaseResponse response) {
      print("-----------------");
      print(_otpController.text);
      showFlashMsg(response.message!);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ResetPasswordScreen(response.data!)));
    }).catchError((e) {

      showFlashMsg(e.toString());
      print(e);
      showFlashMsg(e.Message!);
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
                      child: Image(
                          image:
                              AssetImage("assets/images/logo_lenzcamera.png"))),
                ),
                SizedBox(height: 50),

                PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Color(0xff474747),
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {},
                    length: 5,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      selectedColor: Color(0xff474747),
                      activeColor: Color(0xffec3436),
                      inactiveColor: Color(0xffec3436),
                      fieldHeight: 40,
                      // fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    controller: _otpController,
                    validator: (val) {
                      if (!emailSent) return null;
                      if (val!.isEmpty) {
                        return "Enter the OTP";
                      }
                      return null;
                    }),
               
                SizedBox(height: 35),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {
                      
                      verifyForgotPasswordOtp();
                    },
                    child: Center(
                        child: Text(
                      "Submit OTP",
                      style: TextStyle(fontSize: 20, fontFamily: 'Intro', fontWeight: FontWeight.w600, color: Colors.white),
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

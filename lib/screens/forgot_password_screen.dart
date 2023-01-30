import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/otp_screen.dart';
import 'package:lenzcamera/screens/verify_forgot_pwd_otp_screen.dart';
import 'package:lenzcamera/utils/constants.dart';
import 'package:lenzcamera/utils/helper.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  BaseResponse? response;
  ForgotPasswordScreen(this.response);
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends BaseStatefulState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  bool emailSent = false;
  bool isMobileNumber = false;

  @override
  void initState() {
    super.initState();
  }

  void forgotPasswordOTPSend() {
    if (!_form.currentState!.validate()) {
      return;
    }

    showLoader();
    NetworkManager.shared
        .forgotPasswordOTPSend(_emailController.text, "")
        .then((BaseResponse response) {
      hideLoader();
      print(_emailController.text);
      setState(() {
        emailSent = true;
      });
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyForgotPwddOtpScreen(response.data)));
    }).catchError((e) {
      hideLoader();
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
          titleTextStyle: TextStyle(
              fontSize: 14, fontFamily: "Intro", fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
          backgroundColor: kappBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Center(
                    child: Container(
                        width: 220,
                        child: Image(
                            image: AssetImage(
                                "assets/images/logo_lenzcamera.png"))),
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
                    //  height: 40,
                    child: TextFormField(
                        enabled: !emailSent,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: "",
                        ),
                        controller: _emailController,
                        validator: (val) {
                          if (isMobileNumber) {
                            if (val!.isEmpty) return "Enter Mobile/Email";
                          } else {
                            if (!Helper.validateEmail(val!)) {
                              return "Please enter a valid email";
                            }
                          }

                          return null;
                        }),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {
                        forgotPasswordOTPSend();

                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) =>
                        // OtpScreen()));
                      },
                      child: Center(
                          child: Text(
                        "Send OTP",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {

  ResetPasswordScreen(this.OtpUrlKey);
  String OtpUrlKey;
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final _passwordController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  bool _obscureText= true;
  bool  _obscureText1= true;


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
  
  void resetPassword(){
   
   NetworkManager.shared.resetPassword(<String, dynamic>{
        "OtpUrlKey" : widget.OtpUrlKey,
        "password" : _passwordController.text
       }).then((BaseResponse response) {

        showFlashMsg(response.message!);
     Navigator.push(
                    context,
                      MaterialPageRoute(
                      builder: (context) =>
                      LoginScreen()));
    }).catchError((Object obj) {
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reset Password"),
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
        padding: EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 200),
            SizedBox(height: 12),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Enter New Password",
                style: TextStyle(
                    color: Color(0xff747474),
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                       icon: Icon(
                                _obscureText?
                                Icons.visibility
                            : Icons.visibility_off,
                          color: Color(0xff6e6e6c),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  obscureText:_obscureText,
                  controller: _passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter new password";
                    }
                    return null;
                  }),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Confirm Password",
                style: TextStyle(
                    color: Color(0xff747474),
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                          icon: Icon(
                                _obscureText1?
                                Icons.visibility
                            : Icons.visibility_off,
                          color: Color(0xff6e6e6c),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText1=!_obscureText1;
                          });
                        },
                      ),
                    ),
                  ),
                  obscureText: _obscureText1,
                  controller: _confirmpwdController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Re-type password";
                    }
                    if (val != _passwordController.text) {
                      return "Password should be same";
                    }
                    if (val.length < 8) {
                      return "Please type atleas 8 digit password";
                    }
                    return null;
                  }),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffec3436),
                ),
                onPressed: () {

                  print("hhhhhhhhhhhhhhhh");
                  resetPassword();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Center(
                    child: Text(
                  "Submit Password",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

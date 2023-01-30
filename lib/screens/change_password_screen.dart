import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/profile_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class ChangePasswordScreen extends StatefulWidget {
  // NewRegister? user;
  // ChangePasswordScreen(this.user);
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  LoginCustomer? user = LoginCustomer();

  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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

  void onChangeButtonTapped() {
    if (!_form.currentState!.validate()) {
      return;
    }
    String password = _passwordController.text;
    String newPassword = _newPasswordController.text;

    NetworkManager.shared.changePassword(<String, dynamic>{
      "custId": NetworkManager.shared.userId,
      'oldPassword': password,
      'newPassword': newPassword
    }).then((BaseResponse response) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      showFlashMsg(response.message!);

      print("================");
      print("password");
      print(newPassword);
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
          title: Text("Change Password"),
          titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(children: [
                SizedBox(height: 200),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Current Password",
                    style: TextStyle(
                        color: Color(0xff747474),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  //  height: 60,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        border: OutlineInputBorder(),
                        labelText: "",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
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
                      obscureText: _obscureText,
                      controller: _passwordController,
                      validator: (val) {
                        if (val!.isEmpty)
                          return "Please enter your current password";
                        return null;
                      }),
                ),
                SizedBox(height: 12),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     "*Required",
                //     style: TextStyle(
                //         color: Color(0xffb2232b),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 10),
                //   ),
                // ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "New Password",
                    style: TextStyle(
                        color: Color(0xff747474),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  // height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        border: OutlineInputBorder(),
                        labelText: "",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(
                              _obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xff6e6e6c),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText1 = !_obscureText1;
                              });
                            },
                          ),
                        ),
                      ),
                      obscureText: _obscureText1,
                      controller: _newPasswordController,
                      validator: (val) {
                        if (val!.isEmpty) return "Please enter a new password";
                        if (val == _passwordController.text) {
                          return ("Old password cannot be set as new password");
                        }
                      }),
                ),
                SizedBox(height: 12),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     "*Minimum 6 Characters Required",
                //     style: TextStyle(
                //         color: Color(0xffb2232b),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 10),
                //   ),
                // ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                        color: Color(0xff747474),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  // height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: "",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(
                              _obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xff6e6e6c),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                        ),
                      ),
                      obscureText: _obscureText2,
                      controller: _confirmPasswordController,
                      validator: (val) {
                        if (val!.isEmpty) return "Retype the password";
                        if (val != _newPasswordController.text)
                          return "Passwords should be same";
                        if (val.length < 6)
                          return "Minimum 6 characters required";
                        return null;
                      }),
                ),
                SizedBox(height: 12),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     "*Password Does not Match",
                //     style: TextStyle(
                //         color: Color(0xffb2232b),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 10),re
                //   ),
                // ),
                SizedBox(height: 80),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {
                      onChangeButtonTapped();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Center(
                        child: Text(
                      "CHANGE PASSWORD",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

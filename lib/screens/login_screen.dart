import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_connection.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/screens/filter_screen.dart';
import 'package:lenzcamera/screens/forgot_password_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/register_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulState<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  BaseResponse? response;

  bool _obscureText = true;

  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  void onLoginButtonTapped() {
    if (!_form.currentState!.validate()) {
      return;
    }

    String username = _usernameController.text;
    String password = _passwordController.text;

    NetworkManager.shared.userLogin(<String, dynamic>{
      "userName": username,
      "password": password
    }).then((BaseResponse<LoginCustomer> response) {
      SessionsManager.saveUserToken(response.data?.token ?? '');
      NetworkManager.shared.userToken = response.data?.token ?? "";

      if (response.data!.customerId!.isNotEmpty) {
        SessionsManager.saveUserId(response.data?.customerId ?? '');
        NetworkManager.shared.userId = (response.data!.customerId ?? '');

        NetworkManager.shared.refreshTokens();
      } else {
        String customerId = '';
        SessionsManager.saveUserId(customerId);
        NetworkManager.shared.userId = (customerId);
        NetworkManager.shared.refreshTokens();
      }

      showFlashMsg(response.message!);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return HomeScreen();
        },
      ), (route) => false);
    }).catchError((e) {
      showFlashMsg(e.toString());
      print(e);
      // showFlashMsg(e.message);
      // showFlashMsg("Invalid Username/Password");
    });
  }

  void mergeCart() {
    NetworkManager.shared
        .mergeCart(<String, dynamic>{
          "custId": NetworkManager.shared.userId,
          "guestId": NetworkManager.shared.guestId
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          showFlashMsg(e.toString());
          print(e);
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          return true;
        } else {
          return false;
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: Container(
                      width: 220,
                      child: Image(
                        image: AssetImage("assets/images/logo_lenzcamera.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _form,
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email Or Mobile Number",
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
                          controller: _usernameController,
                          validator: (val) {
                            if (val!.isEmpty) return "Enter Mobile/Email";
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.
                                //only(left:10, top:5, bottom:5),
                                symmetric(vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffb0b0b0)),
                            ),
                            labelText: "",
                          )),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffb0b0b0)),
                            ),
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
                            if (val!.isEmpty) return "Enter your Password";
                            return null;
                          }),
                    ),
                  ]),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffec3436),
                    ),
                    onPressed: () {
                      onLoginButtonTapped();
                      mergeCart();
                    },
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(height: 40),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ForgotPasswordScreen(response?.data)));
                    },
                    child: Center(
                        child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color(0xff454545),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont't have an account? ",
                      style: TextStyle(fontSize: 14, color: Color(0xff757575)),
                    ),
                    SizedBox(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffec3436)),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: Colors.white,
          //   type: BottomNavigationBarType.fixed,
          //   onTap: (index){},
          //   selectedItemColor: Color(0xffdb4454),
          //   unselectedItemColor: Color(0xff8e8e8e),
          //   selectedFontSize: 12,
          //   unselectedFontSize: 12,
          //   showUnselectedLabels: true,
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.home,
          //         size: 30,
          //       ),
          //       label: "Home",
          //     ),

          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.category_outlined,
          //             size: 25),
          //         label: "Categories"),

          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.shopping_cart_outlined,
          //           size: 30),
          //       label: "Cart",
          //     ),

          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search,
          //           size: 30),
          //       label: "Search",
          //     ),

          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.person_outline,
          //           size: 30),
          //       label: "Profile",
          //     ),
          //   ],

          // ),
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

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/otp_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseStatefulState<RegisterScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;
  bool _obscureText = true;

  LoginCustomer? customer;

  void register() {
    showLoader();
    if (!_form.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> map = {
      'email': _emailController.text,
      'mobile': _mobileController.text,
      'name': _customerNameController.text,
      'password': _passwordController.text,
    };

    NetworkManager.shared
        .newRegister(map)
        .then((BaseResponse<NewRegister> response) {
      print("Customer--Id: ${response.data!.custId ?? 0}");
      hideLoader();
      showFlashMsg(response.message!);
      SessionsManager.saveUserId(response.data?.custId ?? 0);
      NetworkManager.shared.userId = response.data!.custId ?? 0;
      NetworkManager.shared.refreshTokens();

      print("Customer--Id: ${SessionsManager.userId}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(response.data?.otpUrlKey),
        ),
      );
    }).catchError((e) {
      hideLoader();
      showFlashMsg(e.toString());
    });
  }

  void mergeCart() {
    NetworkManager.shared
        .userLogin(<String, dynamic>{
          "custId": NetworkManager.shared.userId,
          "guestId": NetworkManager.shared.guestId
        })
        .then((BaseResponse<LoginCustomer> response) {})
        .catchError((e) {
          showFlashMsg(e.toString());
          print(e);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                    height: 100,
                    width: 250,
                    // color: Colors.red,
                    child: Image.asset('assets/images/logo_lenzcamera.png')),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Create New Account to access thousands of products',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Customer Name*',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText:
                              isDense: true,
                            ),
                            controller: _customerNameController,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Email ID*',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Email ID'
                            ),
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) return "Enter Your Email ID";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Mobile*',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Mobile'
                            ),
                            controller: _mobileController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Mobile Number';
                              }
                              if (value.length < 8) {
                                return 'Enter Valid Phone Number';
                              }
                              return null;
                            },
                            // validator: (value) {
                            //   if (value!.isEmpty)
                            //     return "Enter your Mobile Number";
                            //   return null;
                            // },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Password*',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: " ",
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Password';
                              }
                              if (value.length <= 6) {
                                return 'Must be more than 6 character';
                              }
                              return null;
                            },
                          ),
                          //  TextFormField(
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(),
                          //     // labelText: 'Password'
                          //     isCollapsed: false,
                          //   ),
                          //   controller: _passwordController,
                          //   validator: (value) {
                          //     if (value!.isEmpty)
                          //       return "Minimum 6 characters required";
                          //     return null;
                          //   },
                          // ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() => isChecked = value!);
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                            Text(
                              'I Read and Agree to',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PrivacyPolicyScreen()));
                              },
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        // if(isChecked==false)
                        // Row(children: [Text("Please Accept Terms & Conditions",style: TextStyle(
                        //           color: Colors.grey.shade600,
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.bold,
                        //             ),)],),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isChecked == false
                                ? null
                                : () {
                                    register();
                                    mergeCart();
                                  },
                            child: Text(
                              (isChecked == true)
                                  ? 'Sign Up'
                                  : "Accept Terms & Conditions",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
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

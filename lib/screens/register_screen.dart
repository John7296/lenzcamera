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

  LoginCustomer? customer;

  @override
  void initState() {
    super.initState();
    // register();
  }

  // void showFlashMsg(String msg, {Color color = Colors.grey}) {
  //   showFlash(
  //     context: context,
  //     duration: const Duration(seconds: 10),
  //     builder: (context, controller) {
  //       return Flash(
  //         controller: controller,
  //         behavior: FlashBehavior.floating,
  //         position: FlashPosition.bottom,
  //         boxShadows: kElevationToShadow[2],
  //         backgroundColor: Colors.grey,
  //         reverseAnimationCurve: Curves.easeInCirc,
  //         forwardAnimationCurve: Curves.easeInOutBack,
  //         margin: const EdgeInsets.all(8.0),
  //         borderRadius: BorderRadius.circular(6.0),
  //         horizontalDismissDirection: HorizontalDismissDirection.horizontal,
  //         child: FlashBar(
  //           content: Text(
  //             msg,
  //             style: const TextStyle(fontSize: 15, color: Colors.redAccent),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void register() {
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
      showFlashMsg(response.data.toString());
      SessionsManager.saveUserId(response.data?.custId ?? 0);

      print("Customer--Id: ${SessionsManager.userId}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(response.data?.otpUrlKey),),);
    }).catchError((e) {
      showFlashMsg(e.toString());
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
                                fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro'),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Customer Name*',
                              style: TextStyle(color: Colors.grey.shade600,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro'),
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
                              if (value!.isEmpty) return "Enter your Name";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Email ID',
                                style: TextStyle(color: Colors.grey.shade600,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro')),
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
                              if (value!.isEmpty) return "Enter your Email ID";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Mobile',
                                style: TextStyle(color: Colors.grey.shade600,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro')),
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
                              if (value!.isEmpty)
                                return "Enter your Mobile Number";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('Password',
                                style: TextStyle(color: Colors.grey.shade600,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro')),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Password'
                              isCollapsed: false,
                            ),
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Minimum 6 charaters required";
                              return null;
                            },
                          ),
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
                              'I Read and agree to',
                              style: TextStyle(
                                  color: Colors.grey.shade600,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro'),
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
                                'Terms & conditions',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Intro',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      // (isChecked==false)?Text('PLEASE ACCEPT TERMS AND CONDITIONS',style: TextStyle(fontFamily: 'Intro',color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),):
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20,fontFamily: 'Intro'),
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
                              'Already Have an Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12,fontFamily: 'Intro'),
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
                                    fontFamily: 'Intro',
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

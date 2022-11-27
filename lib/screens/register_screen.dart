import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/screens/login_screen.dart';
import 'package:lenzcamera/screens/otp_screen.dart';
import 'package:lenzcamera/screens/privacy_policy_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // register();
  }

  void register() {
    // if (!_form.currentState!.validate()) {
    //   return;
    // }

    Map<String, dynamic> map = {
      'email': _emailController.text,
      'mobile': _mobileController.text,
      'name': _customerNameController.text,
      'password': _passwordController.text,
    };

    NetworkManager.shared
        .newRegister(map)
        .then((BaseResponse<NewRegister> response) {
      debugPrint("respones regi");
      // print((response.data!.otpUrlKey));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen(response.data?.otpUrlKey)));

      // showFlashMsg(response.message!);
      // Future.delayed(const Duration(milliseconds: 500), () {

      // });
    }).catchError((Object e) {
      print("error ");
      print(e.toString());
    });
    // print(value.toString());
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
                      height: 80,
                      width: 150,
                      // color: Colors.red,
                      child: Image.asset('assets/Logo.png')),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Create New Account to access thousands of products',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Customer Name*',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Customer Name'
                            ),
                            controller: _customerNameController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Email ID',
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Email ID'
                            ),
                            controller: _emailController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Mobile',
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Mobile'
                            ),
                            controller: _mobileController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Password',
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // labelText: 'Password'
                            ),
                            controller: _passwordController,
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
                                  fontWeight: FontWeight.bold, fontSize: 12),
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
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
                                  fontWeight: FontWeight.bold, fontSize: 12),
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
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

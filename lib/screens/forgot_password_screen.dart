import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
            onPressed: () {},
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(height: 200),
              Center(
                child: Container(
                    width: 220,
                    child: Image(image: AssetImage("assets/lenzcamera.png"))),
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
              TextFormField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffb0b0b0)),
                ),
                labelText: " ",
              )),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.topLeft,
                // child: Text("*Required",
                //     style: TextStyle(
                //         fontSize: 11,
                //         color: Color(0xffc71b32),
                //         fontWeight: FontWeight.w600)),
              ),
              Container(
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffec3436),
                  ),
                  onPressed: () {},
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
    );
  }
}

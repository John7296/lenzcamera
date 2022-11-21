import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class ChangePasswordScreen extends StatefulWidget{
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           centerTitle: true,
            title: Text("Change Password"),
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
          padding: EdgeInsets.only(left:24, right:24),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 200),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Current Password",
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
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Color(0xff6e6e6c),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                   obscureText: true,
                  ),
                ),
                 SizedBox(height: 12),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: Text("*Required", style: TextStyle(
                                color: Color(0xffb2232b),
                                fontWeight: FontWeight.w600,
                                fontSize: 10), ),
                 ),
                 SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("New Password",
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
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Color(0xff6e6e6c),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                   obscureText: true,
                  ),
                ),

                SizedBox(height: 12),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: Text("*Minimum 6 Characters Required", style: TextStyle(
                                color: Color(0xffb2232b),
                                fontWeight: FontWeight.w600,
                                fontSize: 10), ),
                 ),
                 SizedBox(height: 8),
          
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Confirm Password",
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
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb0b0b0)),
                    ),
                    labelText: " ",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Color(0xff6e6e6c),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  obscureText: true,
                  ),
                ),

                   SizedBox(height: 12),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: Text("*Password Does not Match", style: TextStyle(
                                color: Color(0xffb2232b),
                                fontWeight: FontWeight.w600,
                                fontSize: 10), ),
                 ),
                  SizedBox(height: 80),
                 
                  Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {
                        Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                     builder: (context) =>
                                    LoginScreen()));
                      },
                      child: Center(
                          child: Text(
                            "CHANGE PASSWORD",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ),
                  
            ]),
          ),
        ),
      ),
    );

  }
}
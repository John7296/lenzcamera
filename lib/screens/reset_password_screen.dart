import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget{
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
          padding: EdgeInsets.only(left:24, right:24),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 200),
                
                 SizedBox(height: 12),
                 
                 SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Enter New Password",
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
                  SizedBox(height: 20),
                 
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {
                          Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            
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
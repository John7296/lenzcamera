import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                              child: Text('Customer Name*',style: TextStyle(color: Colors.grey.shade600),),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: 'Customer Name'
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Email ID',style: TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: 'Email ID'
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft, child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Mobile',style: TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: 'Mobile'
                                ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Password',style: TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 35,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: 'Password'
                                ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)), value: false, onChanged: (bool? value) {  },
                            ),
                            Text('I Read and agree to',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                            TextButton(onPressed: (){
                                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                            }, child: Text('Terms & conditions',style: TextStyle(color: Colors.red,fontSize:12,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),)),
                          ],
                        ),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(onPressed: () { 
                            Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                           }, child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                   Colors.red),
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
                          Text('Already Have an Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                          TextButton(onPressed: (){
                                            Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                          }, child: Text('Login',style: TextStyle(color: Colors.red,fontSize:12,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),)),
            
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);



  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey.shade700,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Edit Profile'),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {  },),),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                      height: 80,
                      width: 150,
                      color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      children: [
                    
                        SizedBox(height: 80),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('User Name*',style: TextStyle(color: Colors.grey.shade600),),
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
                   
                     
                       
                      SizedBox(height: 100),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(onPressed: () {  }, child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                   Colors.green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                            ),
                          ),
                        ),
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

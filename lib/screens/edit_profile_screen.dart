import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  final _userNameController = TextEditingController();
  final _emailIdController = TextEditingController();
  final _mobileController = TextEditingController();

  Profile? userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProfile();
  }

  void _getProfile() {
    NetworkManager.shared.getProfile().then((BaseResponse<Profile> response) {
      userProfile = response.data;
      _userNameController.text = userProfile?.custName ?? '';
      _emailIdController.text = userProfile?.emailId ?? '';
      _mobileController.text = userProfile?.phoneNo ?? '';
    }).catchError((e) {
      print(e.toString());
    });
  }

  void onUpdateButtonTapped() {
    NetworkManager.shared
        .updateProfile({
          "custId": 386,
          "custName": _userNameController.text,
          "phoneNo": _mobileController.text,
          "emailId": _emailIdController.text,
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade700,
            title: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('Edit Profile'),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    height: 80,
                    width: 150,
                    child: Image(
                      image: AssetImage("assets/images/lens.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'User Name*',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(5),
                              // labelText: 'Customer Name'
                            ),
                            controller: _userNameController,
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
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Email ID'
                                ),
                            controller: _emailIdController,
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
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _mobileController,
                          ),
                        ),
                        SizedBox(height: 100),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              onUpdateButtonTapped();
                            },
                            child: Text(
                              'Update',
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'Intro'),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
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

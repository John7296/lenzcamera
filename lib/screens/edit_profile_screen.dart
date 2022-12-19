import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/screens/profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends BaseStatefulState<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailIdController = TextEditingController();
  final _mobileController = TextEditingController();

  Profile? userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 10), () {
      getProfile();
    });
  }

  void getProfile() {
    showLoader();
    NetworkManager.shared.getProfile().then((BaseResponse<Profile> response) {
      hideLoader();

      userProfile = response.data;
      _userNameController.text = userProfile?.custName ?? '';
      _emailIdController.text = userProfile?.emailId ?? '';
      _mobileController.text = userProfile?.phoneNo ?? '';
    }).catchError((e) {
      hideLoader();
      print(e.toString());
    });
  }

  void onUpdateButtonTapped() {
    // showLoader();
    NetworkManager.shared.updateProfile({
      "custId": NetworkManager.shared.userId,
      "custName": _userNameController.text,
      "phoneNo": _mobileController.text,
      "emailId": _emailIdController.text,
    }).then((BaseResponse response) {
      // hideLoader();
      showFlashMsg("Profile Updated");
      Navigator.pop(context, true);
      getProfile();
    }).catchError((e) {
      // hideLoader();
      showFlashMsg(e.toString());
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
            child: Form(
              key: formKey,
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
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontFamily: 'Intro'),
                              ),
                            )),
                        Container(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _userNameController,
                            validator: (value) {
                              if (value!.isEmpty) return "Enter UserNmae";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Email ID',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Intro')),
                            )),
                        Container(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _emailIdController,
                            validator: (value) {
                              if (value!.isEmpty) return "Enter Email Id";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Mobile',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Intro')),
                            )),
                        Container(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _mobileController,
                            validator: (value) {
                              if (value!.isEmpty) return "Enter Mobile Number";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 100),
                        // if(_userNameController.text.isNotEmpty)
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                onUpdateButtonTapped();
                                getProfile();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileScreen()));
                              }
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

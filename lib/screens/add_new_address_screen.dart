import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/state_list.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  String? selectedCity;
  String? selectedState;
  bool isCheckedSA = false;
  bool isCheckedBA = false;
  List<CityList> cityList = [];
  List<StateList> stateList = [];

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressL1Controller = TextEditingController();
  final _addressL2Controller = TextEditingController();
  final _phoneController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _pinCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cityNames();
  }

  void onSaveButtonTapped() {
    NetworkManager.shared
        .updateAddress({
          "addLine1": _addressL1Controller.text,
          "addLine2": _addressL2Controller.text,
          "addressType": "",
          "country": "QATAR",
          "custAdressId": 418,
          "custId": NetworkManager.shared.userId,
          "district": "ad-Dawhah",
          "firstName": _firstNameController.text,
          "isDefaultBillingAddress": isCheckedBA,
          "isDefaultShippingAddress": isCheckedSA,
          "landmark": _landmarkController.text,
          "lastName": _lastNameController.text,
          "latitude": 10.0224066,
          "longitude": 76.3041375,
          "phone": _phoneController.text,
          "pincode": _pinCodeController.text,
          "state": "ad-Dawhah",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void cityNames() {
    NetworkManager.shared
        .cityListAddress()
        .then((BaseResponse<List<CityList>> response) {
      setState(() {
        cityList.clear();
        cityList.addAll(response.data!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void stateNames() {
    NetworkManager.shared
        .stateListAddress()
        .then((BaseResponse<List<StateList>> response) {
      setState(() {
        stateList.clear();
        stateList.addAll(response.data!);
      });
    }).catchError((e) {
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
              child: Text('Add New Address'),
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
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Customer Name'
                                ),
                            controller: _firstNameController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Last Name',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Email ID'
                                ),
                            controller: _lastNameController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Address Line 1',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _addressL1Controller,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Address Line 2',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Password'
                                ),
                            controller: _addressL2Controller,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Phone +974',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _phoneController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('PinCode',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _pinCodeController,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              // child: Text('Mobile',
                              //     style:
                              //         TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'QATAR'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('',
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            )),
                        Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: DropdownButton(
                              items: stateList
                                  .map((StateList) => DropdownMenuItem<String>(
                                        value: stateList.toString(),
                                        child: Text(stateList.first.name ?? ''),
                                      ))
                                  .toList(),
                              onChanged: (StateList) => setState(
                                  () => selectedState = StateList.toString()),
                            )),
                        SizedBox(height: 30),
                        Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: DropdownButton(
                              items: cityList
                                  .map(
                                    (CityList) => DropdownMenuItem<String>(
                                        value: cityList.toString(),
                                        child: Text(cityList.first.name ?? '')
                                        // ListView.builder(
                                        //   itemCount: cityList.length,
                                        //   itemBuilder:
                                        //       (BuildContext context, int index) {
                                        //     return Container(
                                        //       child: Text(cityList[index]
                                        //           .name
                                        //           .toString()),
                                        //     );
                                        //   },
                                        // ),
                                        ),
                                  )
                                  .toList(),
                              onChanged: (CityList) => setState(
                                  () => selectedCity = cityList.toString()),
                            )),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              value: isCheckedBA,
                              onChanged: (value) {
                                setState(() => isCheckedBA = value!);
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                            Text(
                              'Make As Default Billing Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              value: isCheckedSA,
                              onChanged: (value) {
                                setState(() => isCheckedSA = value!);
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                            Text(
                              'Make As Default Shipping Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Landmark',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Mobile'
                                ),
                            controller: _landmarkController,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // onSaveButtonTapped();
                              cityNames();
                              stateNames();
                            },
                            child: Text(
                              'Save',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/state_list.dart';
import 'package:lenzcamera/screens/address_screen.dart';
import 'package:lenzcamera/screens/checkout_screen.dart';

class AddNewAddressScreen extends StatefulWidget {
  bool fromCheckout;
  AddNewAddressScreen({this.fromCheckout = true, super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends BaseStatefulState<AddNewAddressScreen> {
  final formKey = GlobalKey<FormState>();
  List<AddressList> addressList = [];
  String? selectedCity;
  String? selectedState;
  bool isCheckedSA = false;
  bool isCheckedBA = false;
  List<CityList> cityList = [];
  List<StateList> stateList = [];
  StateList? showSelectedState;
  CityList? showSelectedCity;

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
    Future.delayed(Duration(milliseconds: 300), () {
      getAddress();
    });

    stateNames();
  }

  List<StateList>? showCityList(String name) {
    List<StateList> newStateList = [];

    for (StateList element in stateList) {
      if (element.name == name) {
        newStateList.add(element);
      }
    }
    return newStateList;
  }

  List<CityList>? showStateList(String name, StateList stateList) {
    List<CityList> newCityList = [];

    for (CityList element in cityList) {
      if (element.id == stateList.id) {
        newCityList.add(element);
      }
    }
    return newCityList;
  }

  void onSaveButtonTapped() {
    // if (!_form.currentState!.validate()) {
    //   return;
    // }

    NetworkManager.shared.addAddress({
      "addLine1": _addressL1Controller.text,
      "addLine2": _addressL2Controller.text,
      "addressType": "",
      "country": "QATAR",
      "custId": NetworkManager.shared.userId,
      "district": showSelectedCity!.name,
      "firstName": _firstNameController.text,
      "isDefaultBillingAddress": isCheckedBA,
      "isDefaultShippingAddress": isCheckedSA,
      "landmark": _landmarkController.text,
      "lastName": _lastNameController.text,
      "latitude": 10.0224066,
      "longitude": 76.3041375,
      "phone": _phoneController.text,
      "pincode": _pinCodeController.text,
      "state": showSelectedState!.name,
    }).then((BaseResponse response) {
      showFlashMsg(response.message!);
      (widget.fromCheckout == true)
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckoutScreen(0, 0, context)))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddressScreen()));
    }).catchError((e) {
      showFlashMsg(e.toString());
      showFlashMsg(e.toString());
      print(e.toString());
    });
  }

  void cityNames(int id) {
    NetworkManager.shared
        .cityListAddress(id)
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

  void getAddress() {
    showLoader();
    NetworkManager.shared
        .getAddressList()
        .then((BaseResponse<List<AddressList>> response) {
      showFlashMsg(response.message!);
      hideLoader();
      setState(() {
        addressList.clear();
        addressList.addAll(response.data!);
      });
    }).catchError((e) {
      hideLoader();
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
              child: Text(
                'Add New Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                (widget.fromCheckout == true)
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(0, 0, context)))
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressScreen()));
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Customer Name'
                                  ),
                              controller: _firstNameController,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Enter First Name";
                                } else {
                                  return null;
                                }
                              },
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Email ID'
                                  ),
                              controller: _lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) return "Enter Last Name";
                                return null;
                              },
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Mobile'
                                  ),
                              controller: _addressL1Controller,
                              validator: (value) {
                                if (value!.isEmpty) return "Enter Address";
                                return null;
                              },
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Password'
                                  ),
                              controller: _addressL2Controller,
                              validator: (value) {
                                if (value!.isEmpty) return "Enter Address";
                                return null;
                              },
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Mobile'
                                  ),
                              controller: _phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Phone Number";
                                } else if (value.length != 8) {
                                  return "Enter Valid Phone Number";
                                }
                                return null;
                              },
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Mobile'
                                  ),
                              controller: _pinCodeController,
                              validator: (value) {
                                if (value!.isEmpty) return "Enter PinCode";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text('Country',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                children: [
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("QATAR"),
                                  )),
                                ],
                              )
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //       border: OutlineInputBorder(),
                              //       labelText: 'QATAR'),
                              //   readOnly: true,
                              // ),
                              ),
                          SizedBox(height: 10),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text('State',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold)),
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
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<StateList>(
                                hint: Text("Select State"),
                                isExpanded: true,
                                dropdownColor: Color(0xffadadad),
                                elevation: 5,
                                value: showSelectedState,
                                underline: Container(color: Colors.transparent),
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                ),
                                onChanged: (StateList? value) {
                                  cityNames(value!.id!);
                                  // This is called when the user selects an item.
                                  setState(() {
                                    showSelectedState = value;
                                  });
                                  print(showSelectedState!.name);
                                },
                                items: stateList
                                    .map<DropdownMenuItem<StateList>>(
                                        (StateList value) {
                                  return DropdownMenuItem<StateList>(
                                    value: value,
                                    child: Text(value.name ?? ''),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
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
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<CityList>(
                                hint: Text("Select City"),
                                isExpanded: true,
                                dropdownColor: Color(0xffadadad),
                                elevation: 5,
                                value: showSelectedCity,
                                underline: Container(color: Colors.transparent),
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                ),
                                onChanged: (CityList? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    showSelectedCity = value;
                                  });
                                },
                                items: cityList.map<DropdownMenuItem<CityList>>(
                                    (CityList value) {
                                  return DropdownMenuItem<CityList>(
                                    value: value,
                                    child: Text(value.name ?? ''),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
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
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          Container(
                            height: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(5)
                                  // labelText: 'Mobile'
                                  ),
                              controller: _landmarkController,
                              validator: (val) {
                                if (val!.isEmpty) return "Enter Landmark";
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 400,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  onSaveButtonTapped();
                                  getAddress();

                                  showFlashMsg("Address Added");
                                  setState(() {});
                                }
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
            ),
          )),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  List<String> items = ['One', 'Two', 'Three', 'Four', 'Five'];
  String? selectedItem;

  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _addressL1Controller = TextEditingController();
  final _addressL2Controller = TextEditingController();
  final _phoneController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _pinCodeController = TextEditingController();

  void addAddress() {
    // if (!_form.currentState!.validate()) {
    //   return;
    // }

    // dismissKeyboard();
    // showLoader();

    Map<String, dynamic> map = {
      'firstName': _firstNameController.text,
      'lastName': _secondNameController.text,
      'addLine1': _addressL1Controller.text,
      'addLine2': _addressL2Controller.text,
      'phone': _phoneController.text,
      'landmark': _landmarkController.text,
      'pincode': _pinCodeController,
    };

    NetworkManager.shared.addAddress(map).then((BaseResponse response) {
      // hideLoader();

      // showFlashMsg(response.message!);
      // goBack();
    }).catchError((e) {
      // hideLoader();
      // showFlashMsg(obj.toString());
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
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5)
                                // labelText: 'Password'
                                ),
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
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (item) => setState(
                                  () => selectedItem = item.toString()),
                            )
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(),
                            //     // labelText: 'Mobile'
                            //   ),
                            // ),
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
                            child: DropdownButton(
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (item) => setState(
                                  () => selectedItem = item.toString()),
                            )
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(),
                            //     // labelText: 'Mobile'
                            //   ),
                            // ),
                            ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              value: false,
                              onChanged: (bool? value) {},
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
                              value: false,
                              onChanged: (bool? value) {},
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
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/screens/add_new_address_screen.dart';
import 'package:lenzcamera/screens/edit_address_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends BaseStatefulState<AddressScreen> {
  List<AddressList> addressList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      address();
    });
  }

  void address() {
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

  void deleteAddress(AddressList address) {
    NetworkManager.shared
        .deleteAddress(<String, dynamic>{})
        .then((BaseResponse response) {})
        .catchError((e) {
          showFlashMsg(e.toString());
          print(e.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Your Addresses'),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.favorite_border),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.shopping_cart),
        //   ),
        // ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewAddressScreen()));
                  },
                  child: Text(
                    "+Add New Address",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        Expanded(
          child: Container(
            height: 600,
            color: Colors.grey.shade100,
            child: ListView.builder(
                itemCount: addressList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(addressList[index].firstName ?? ''),
                                Text(addressList[index].lastName ?? ''),
                                Text(addressList[index].addLine1 ?? ''),
                                Text(addressList[index].addLine2 ?? ''),
                                Text(addressList[index].country ?? ''),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditAddressScreen(
                                                addressList[index].firstName,
                                                addressList[index].lastName,
                                                addressList[index].addLine1,
                                                addressList[index].addLine2,
                                                addressList[index].phone,
                                                addressList[index].pincode,
                                                addressList[index].landmark,
                                                context
                                              )));
                                },
                                icon: Icon(Icons.draw, color: Colors.grey),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteAddress(addressList[index]);
                                },
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

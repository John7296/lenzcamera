import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/screens/add_new_address_screen.dart';

class AddressBottomSheetWidget extends StatefulWidget {
  List<AddressList> addressList = [];
   AddressBottomSheetWidget(this.addressList);

  @override
  State<AddressBottomSheetWidget> createState() =>
      _AddressBottomSheetWidgetState();
}

class _AddressBottomSheetWidgetState extends State<AddressBottomSheetWidget> {
AddressList? selectedBillingAddress;




  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddNewAddressScreen()));
                              },
                              child: Text(
                                "+Add New Address",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
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
                            itemCount: widget.addressList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    selectedBillingAddress = widget.addressList[index];
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(widget.addressList[index]
                                                      .firstName ??
                                                  ''),
                                              Text(
                                                  widget.addressList[index].lastName ??
                                                      ''),
                                              Text(
                                                  widget.addressList[index].addLine1 ??
                                                      ''),
                                              Text(
                                                  widget.addressList[index].addLine2 ??
                                                      ''),
                                              Text(widget.addressList[index].country ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                        // Spacer(),
                                        // Column(
                                        //   children: [
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressScreen()));
                                        //       },
                                        //       icon: Icon(Icons.draw, color: Colors.grey),
                                        //     ),
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         // deleteAddress(addressList[index]);
                                        //       },
                                        //       icon: Icon(Icons.delete_outline, color: Colors.red),
                                        //     ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ]);
            }).then((value) {
          setState(() {});
        });
      },
      child: Text(
        "CHANGE",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

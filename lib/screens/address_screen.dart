import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/add_new_address_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Row(
              children: [
                TextButton(
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
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Abum nbuildings'),
                          SizedBox(height: 5),
                          Text('Abum nbuildings'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.draw, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline, color: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

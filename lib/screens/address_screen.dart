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
            onPressed: () { Navigator.pop(context);},
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
                       Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewAddressScreen()));
                    },
                    child: Text(
                      "+Add New Address",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )),
              ],
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}

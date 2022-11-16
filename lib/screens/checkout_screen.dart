import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget{
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: Text("Checkout"),
         titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black,
    ),

    body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      TextButton(onPressed: (){}, child: Padding(
        padding: const EdgeInsets.only(left:17, top:15),
        child: Text(
         "+ Add New Address", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xffd0393f))
        ),
      ),), 
      SizedBox(height: 10),
      Divider(
        indent: 20, endIndent: 20,
        color: Colors.grey[300]),

    ],),
    );
  }
}
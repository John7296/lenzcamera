import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/utils/constants.dart';

class ReturnPolicyScreen extends StatefulWidget {
  const ReturnPolicyScreen({super.key});

  @override
  State<ReturnPolicyScreen> createState() => _ReturnPolicyScreenState();
}

class _ReturnPolicyScreenState extends State<ReturnPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Return Policy'),
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
        backgroundColor: kappBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

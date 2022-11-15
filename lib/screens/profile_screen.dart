// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('My Profile'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ],
            backgroundColor: Colors.grey,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            ),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // color: Colors.amber,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(120, 50, 120, 50),
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 100,
                    ),
                  ),
                ),
                Text('qwerty'),
                Text(
                  'qwerty@gmail.com',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Personal"),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Profile"),
                              ),
                              leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.person),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                              ),
                              trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

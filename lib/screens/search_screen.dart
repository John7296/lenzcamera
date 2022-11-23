import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search"),
        titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        actions: [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 40),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffe3e3e3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          //  Container(
                          // margin: EdgeInsets.only(left: 40),
                          Icon(Icons.search_rounded,
                              size: 30, color: Colors.grey.shade600),
                          //  ),
                          SizedBox(width: 24),
                          SizedBox(
                            child: Text(
                              "SEARCH PRODUCTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey.shade600),
                            ),
                          ),
      
                          SizedBox(width: 90),
      
                          Container(
                              height: 20,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilterScreen()));
                                  },
                                  child: Image.asset(
                                      "assets/images/filter_icon.png"))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 600,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Card(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/lens.png"),
                                          height: 100,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Stack(children: [
                                                Container(
                                                  width: 200,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Text(
                                                        "CANON EF 16-35MM F/2.8L  III USM",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                        maxLines: 2),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 220, top: 10),
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.favorite_outlined,
                                                        color: Color(0xff70726f),
                                                      )),
                                                ),
                                              ]),
                                            ]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text("QAR 549.00",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color(0xffdf1715)),
                                                    maxLines: 2),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              margin: EdgeInsets.only(left: 135),
                                              height: 30,
                                              width: 120,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xfffce303),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartScreen()));
                                                },
                                                child: Center(
                                                    child: Text(
                                                  "ADD",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

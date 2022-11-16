import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeaturedProductsScreen extends StatefulWidget {
  const FeaturedProductsScreen({super.key});

  @override
  State<FeaturedProductsScreen> createState() => _FeaturedProductsScreenState();
}

class _FeaturedProductsScreenState extends State<FeaturedProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('My Wishlist'),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.favorite_border),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () { Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body:  Container(
                height: 900,
                color: Colors.white,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Popular Products',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All ➜',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: GridView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 600,
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/lens.jpg"),
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Color(0xff70726f),
                                          )),
                                    ),
                                  ]),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CANON EF 16-35 MM F/4L IS USM ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  Text("QAR 39999.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                  ElevatedButton(
                                    
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellowAccent,
                                      elevation: 0,
                                    ),
                                    onPressed: () {},
                                    child: Center(
                                        child: Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),

            // SizedBox(height: 50),
    );
  }
}
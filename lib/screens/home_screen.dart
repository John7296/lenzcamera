// import 'dart:html';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('Lenz Camera'),
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
            backgroundColor: Colors.grey.shade700,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.circle_outlined),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Doha',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change',
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(Icons.search_rounded,
                                  size: 30, color: Colors.grey.shade600),
                            ),
                            SizedBox(width: 30),
                            SizedBox(
                              child: Text(
                                "SEARCH PRODUCTS",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 70,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
            SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              // color: Colors.amber,
              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
              
             ),
           ),
            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:8,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Card(
                         child: Column(
                           children: [
                             Container(
                              height: 100,
                              width: 100,
                              // color: Colors.red,
                             ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('Product Name',
                        style: TextStyle(fontSize: 20),
                      ),
                              ),
                           ],
                         ),
                       ),
                     ),
                     
                    ],
                  );
                },
              ),
            ),
            SizedBox(
      // height: 551,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
            child: Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: GridTile(
                footer: Container(
                  // margin: EdgeInsets.only(bottom: 5, left: 25),
                  // child: Text(
                  //   'qwerty',
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15,
                  //       fontFamily: "Sofia Pro"),
                  // ),
                ),
                child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Card(
                       child: Column(
                         children: [
                           Container(
                            // height: 100,
                            // width: 100,
                            // color: Colors.red,
                           ),
                         ],
                       ),
                     ),
                   ),
              ),
            ),
          );
        },
      ),
    ),


            // Text(
            //   "FEATURED",
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            // Container(
            //   height: 300,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: 8,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(
            //           height: 100,
            //           width: 100,
            //           color: Colors.red,
            //          ),
            //           Text('12345678',
            //             style: TextStyle(fontSize: 25, ),
            //           ),
                     
            //         ],
            //       );
            //     }, separatorBuilder: (BuildContext context, int index) {
            //       return SizedBox(width:10);
            //   },
            //   ),
            // ),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child:  Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                     )
                );
              },
            ),
            SizedBox(height: 20,),
            Text('BEST SELLER',
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                     ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('1234',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('123',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CartView(
                            //             productlist?.data?.bestsellerProducts![index].image ?? '',
                            //             productlist?.data?.bestsellerProducts![index].name ?? '',
                            //             productlist?.data?.bestsellerProducts![index].price ?? '',
                            //             context)));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          child: Text('ADD'))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

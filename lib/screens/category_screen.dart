import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  int pageCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Category'),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.favorite_border),
            // ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
          backgroundColor: Colors.grey.shade700,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            _pageController.jumpToPage(index);
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                color: Colors.grey.shade800,
                                height: (selectedIndex == index) ? 120 : 0,
                                width: 5,
                              ),
                              Expanded(
                                  child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                alignment: Alignment.center,
                                height: 120,
                                color: (selectedIndex == index)
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white),
                                    // color: Colors.white,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/lens.png"),
                                          height: 80,
                                          width: 80,
                                        ),
                                        Text('CANON EF'),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 1,
                        color: Colors.grey.shade800,
                      );
                    },
                    itemCount: 10),
              ),
              Expanded(
                  child: Container(
                child: PageView(
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < pageCount; i++)
                      Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      height: 140,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/lens.png"),
                                              height: 80,
                                              width: 100,
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'DSLR Cameras',
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/lens.png"),
                                            height: 80,
                                            width: 100,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Mirrorless Cameras',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
// SingleChildScrollView(
//         child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: 8,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
      //             InkWell(
      //               onTap: () {
                      
      //               },
      //               child: Container(
      //                 height: 120,
      //                 width: 100,
      //                 color: Colors.white,
      //                 child: Column(
      //                   children: [
      //                     Image(
      //                       image: AssetImage("assets/images/lens.png"),
      //                       height: 100,
      //                       width: 100,
      //                     ),
      //                     Text('CANON EF'),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ),
    
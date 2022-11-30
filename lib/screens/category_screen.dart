import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  List<TopCategories> categoryList = [];
  int pageCount = 10;
    bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .getTopCategories()
        .then((BaseResponse<List<TopCategories>> response) {
      print(response.data);
      setState(() {
        isLoading = false;
        categoryList.clear();
        categoryList.addAll(response.data!);
        // print(response.data);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

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
                                duration: Duration(milliseconds: 0),
                                color: Colors.grey.shade800,
                                height: (selectedIndex == index) ? 120 : 0,
                                width: 5,
                              ),
                              Expanded(
                                  child: AnimatedContainer(
                                duration: Duration(milliseconds: 0),
                                alignment: Alignment.center,
                                height: 120,
                                color: (selectedIndex == index)
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Container(
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white),
                                    // color: Colors.white,
                                    child: Column(
                                      children: [
                                         Container(
                                          height: 60,
                                          width: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://dev.lenzcamera.com/webadmin/${categoryList[index].imageUrl}"),
                                          )
                                          ),
                                        Text(categoryList[index].catName,maxLines: 2,),
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
                    itemCount: categoryList.length),
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                children: [
                  // for (var i = 0; i < pageCount; i++)
                  Container(
                    height: 650,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: StaggeredGridView.countBuilder(
                        //physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: 12,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (() {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ProductDetailsScreen()));
                            }),
                            child: Card(
                              elevation: 2,
                              // shape: RoundedRectangleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/lens.png"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'DSLR Camera',
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      ),
                    ),
                  ),
                ],
              ))

              //     Container(
              //   child: PageView(
              //     controller: _pageController,
              //     children: [
              //       // for (var i = 0; i < pageCount; i++)
              //         Container(
              //             color: Colors.white,
              //             child: Column(
              //               children: [
              //                 Row(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.all(20),
              //                       child: Container(
              //                         height: 140,
              //                         width: 100,
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           borderRadius: BorderRadius.all(
              //                               Radius.circular(5)),
              //                           boxShadow: [
              //                             BoxShadow(
              //                               color: Colors.grey,
              //                               offset: Offset(0.0, 1.0), //(x,y)
              //                               blurRadius: 6.0,
              //                             ),
              //                           ],
              //                         ),
              //                         child: Column(
              //                           // mainAxisAlignment: MainAxisAlignment.start,
              //                           // crossAxisAlignment:
              //                           //     CrossAxisAlignment.start,
              //                           children: [
              //                             Center(
              //                               child: Image(
              //                                 image: AssetImage(
              //                                     "assets/images/lens.png"),
              //                                 height: 80,
              //                                 width: 100,
              //                               ),
              //                             ),
              //                             Spacer(),
              //                             Padding(
              //                               padding: const EdgeInsets.all(8.0),
              //                               child: Text(
              //                                 'DSLR Cameras',
              //                                 textAlign: TextAlign.center,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Container(
              //                       height: 140,
              //                       width: 100,
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius:
              //                             BorderRadius.all(Radius.circular(5)),
              //                         boxShadow: [
              //                           BoxShadow(
              //                             color: Colors.grey,
              //                             offset: Offset(0.0, 1.0), //(x,y)
              //                             blurRadius: 6.0,
              //                           ),
              //                         ],
              //                       ),
              //                       child: Column(
              //                         // mainAxisAlignment: MainAxisAlignment.start,
              //                         // crossAxisAlignment:
              //                         //     CrossAxisAlignment.start,
              //                         children: [
              //                           Center(
              //                             child: Image(
              //                               image: AssetImage(
              //                                   "assets/images/lens.png"),
              //                               height: 80,
              //                               width: 100,
              //                             ),
              //                           ),
              //                           Spacer(),
              //                           Padding(
              //                             padding: const EdgeInsets.all(8.0),
              //                             child: Text(
              //                               'Mirrorless Cameras',
              //                               textAlign: TextAlign.center,
              //                             ),
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             )),
              //     ],
              //   ),
              // ))
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
    
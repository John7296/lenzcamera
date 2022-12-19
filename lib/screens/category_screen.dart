import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/screens/product_details_screen.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends BaseStatefulState<CategoryScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  List<TopCategories> categoryList = [];
  int pageCount = 10;
  bool isLoading = true;
  List<dynamic> subCategoryList = [];
  var test = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _getCategories();
    });
  }

  void _getCategories() {
    showLoader();
    NetworkManager.shared
        .getTopCategories()
        .then((BaseResponse<List<TopCategories>> response) {
      hideLoader();
      setState(() {
        isLoading = false;
        categoryList.clear();
        categoryList.addAll(response.data!);

        for (var element in categoryList) {
          var parentList = [];
          parentList.addAll(element.code!.split('#'));

          if (parentList.length == 2) {
            if (parentList.elementAt(1).toString() ==
                element.categoryId.toString()) {
              test.add(element);
            }
            // else {
            //   if (parentList.length == 3) {
            //     if (parentList.elementAt(1).toString() ==
            //         element.categoryId.toString()) {}
            //   }
            // }
          }
          print(test);
          // print(parentList);
        }
        // var mainCatList = [];
        // mainCatList.addAll(categoryList[index].code!.split('#'));
        // print(mainCatList.length);
        // if (mainCatList.length == 2) {
        //   var subCatList = [];
        //   subCatList.addAll(mainCatList);
        //   print("subCat${subCatList}");
        // }
        // if (mainCatList.length == 3) {
        //   var childList = [];
        //   childList.addAll(mainCatList);
        //   print("childlist${childList}");
        // }

        // print(response.data);
      });
    }).catchError((e) {
      showFlashMsg(e.toString());
      hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Category',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Intro'),
            ),
          ),
          actions: [
            //    Stack(
            //   children: [
            //     IconButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => WishlistScreen()));
            //       // getBanners();
            //     },
            //     icon: Icon(Icons.favorite_border),
            //   ),
            //   if (DataManager.shared.wishListItems.isNotEmpty)
            //   Positioned(
            //       right: 5,
            //       top: 5,
            //       child: new Container(
            //         padding: EdgeInsets.all(2),
            //         decoration: new BoxDecoration(
            //           color: Colors.red,
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //         constraints: BoxConstraints(
            //           minWidth: 14,
            //           minHeight: 14,
            //         ),
            //         child: Text(
            //           DataManager.shared.wishListItems.length.toString(),
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize:10,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),)
            //   ],
            // ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 500), () {
                      _getCategories();
                    });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CartScreen()));
                    // getBanners();
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                if (DataManager.shared.cartItemsList.isNotEmpty)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: new Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        DataManager.shared.cartItemsList.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
          ],
          backgroundColor: Colors.grey.shade700,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                      print("sublist${subCategoryList.length}");
                      // print(categoryList[index].code!.split('#'));
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
                                              child: Text("")
                                              // CachedNetworkImage(
                                              //     imageUrl:
                                              //         "https://dev.lenzcamera.com/webadmin/${subCategoryList[index].imageUrl}"),
                                              ),
                                        ),
                                        Text(
                                        
                                          test[index],
                                          maxLines: 2,
                                        ),
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
                    itemCount: test.length),
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
                ),
              ),

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

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

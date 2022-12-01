import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';

import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  //  final SearchProducts? product;

  SearchScreen({
    Key? key,
  //  this.product
  }):super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

   String? _searchString = "";
   bool isLoading = false;
  bool isPaging = false;
  bool isSearchStarted = false;
  int currentPage = 1;

   List<Product> _products = [];

   @override
  void initState() {
    super.initState();
    searchProducts();
  }
 

   void searchProducts(){
    setState(() {
      isLoading = true;
   
    });

    isSearchStarted = true;

    NetworkManager.shared.searchProducts(<String, dynamic>{
      "pagesize": 20,
     "custId" :386,


      "currentpage": currentPage,
      "filtervalues": "", 

      "guestId": "", 
      "maxPrice": "1000000", 
      "minPrice": "0",
      "pincode": 8,
      "filter": {
        "category": "",  
      },
      "sortorder": {"field": "prName", "direction": "default"},
      "searchstring": _searchString,
    }).then((BaseResponse<SearchProductsResponse>response) {
       setState(() {
            isLoading= false;
            _products.clear();
            _products.addAll(response.data!.products!);     
      });
    }).catchError((e) {
    print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("hhhhhhhhhhhhhhhhhh");
    // print(_products.first.prName);
    
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
        
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Color(0xffe3e3e3),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: <Widget>[
                  
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(Icons.search_rounded,
                          size: 30, color: Colors.grey)),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {
                      _searchString = value;

                      },
                      onSubmitted: (value) {
                        searchProducts();
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "SEARCH PRODUCTS",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                        height: 20,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterScreen()));
                            },
                            child:
                                Image.asset("assets/images/filter_icon.png"))),
                  ),
                ],
              ),
            ),
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Color(0xffe3e3e3),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 30),
          //           child: Row(
          //             children: [
          //               //  Container(
          //               // margin: EdgeInsets.only(left: 40),
          //               Icon(Icons.search_rounded,
          //                   size: 30, color: Colors.grey.shade600),
          //               //  ),
          //               SizedBox(width: 24),
          //               SizedBox(
          //                 child: Expanded(
          //                   child: TextField(

          //                     style: TextStyle(
          //                         fontWeight: FontWeight.w700,
          //                         fontSize: 16,
          //                         color: Colors.grey.shade600),
          //                   ),
          //                 ),
          //               ),

          //               SizedBox(width: 90),

          //               Container(
          //                   height: 20,
          //                   child: InkWell(
          //                       onTap: () {
          //                         Navigator.pushReplacement(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: (context) =>
          //                                     FilterScreen()));
          //                       },
          //                       child: Image.asset(
          //                           "assets/images/filter_icon.png"))),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        // if(_searchString!.isNotEmpty)
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
                    itemCount:_products.length,
                      itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 160,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:5),
                                      child: Row(
                                  children: [
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:20),
                                               child: Container(
                                                 
                                                 child: CachedNetworkImage(imageUrl: 
                                                 "https://dev.lenzcamera.com/webadmin/${_products[index].imageUrl}", height: 100),
                                               ),
                                             ),
                                           ],
                                         ),
                                         // Image(
                                         //   image: AssetImage(
                                         //       "assets/images/lens.png"),
                                         //   height: 100,
                                         // ),
                                         Expanded(
                                           child: Padding(
                                             padding: const EdgeInsets.only(left:5, right:10, top:20),
                                             child: Column(
                                               crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                 
                                               children: [
                                                 Container(
                                                   width:200,
                                                   child: Text(
                                                     
                                                       _products[index].prName.toString(),
                                                       // "CANON EF 16-35MM F/2.8L  III USM",
                                                       style: TextStyle(
                                                           fontSize: 17,
                                                           fontWeight:
                                                               FontWeight
                                                                   .w600),
                                                       maxLines: 2),
                                                 ),

                                    
                                                 SizedBox(
                                                   height: 20,
                                                 ),

                                                 Text("QAR ${_products[index].unitPrice.toString()}",
                                                       // "QAR 549.00",
                                                         style: TextStyle(
                                                             fontSize: 15,
                                                             fontWeight:
                                                                 FontWeight.w600,
                                                             color:
                                                                 Color(0xffdf1715)),
                                                         maxLines: 2),

                                                         ],
                                                    ),
                                           )), 
                                                 // Row(
                                                 //   children: [
                                                 //     // Text("QAR ${_products[index].unitPrice.toString()}",
                                                 //     //   // "QAR 549.00",
                                                 //     //     style: TextStyle(
                                                 //     //         fontSize: 15,
                                                 //     //         fontWeight:
                                                 //     //             FontWeight.w600,
                                                 //     //         color:
                                                 //     //             Color(0xffdf1715)),
                                                 //     //     maxLines: 2),
                                                 //   ],
                                                 // ),
                                                 SizedBox(height: 10),
                                                 Padding(
                                                   padding: const EdgeInsets.only(right:15),
                                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.end,
                                                     children: [

                                                       IconButton(onPressed: (){}, icon:
                                                       
                                                       Icon(Icons.favorite ), color: Color(
                                                                 0xff70726f)),

                                                       SizedBox(height: 50),
                                                       Container(
                                                         // margin:
                                                         //     EdgeInsets.only(left: 135),
                                                         height: 30,
                                                         width: 110,
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
                                                   ),
                                                 ),
                                      
                                  ],
                                ),
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

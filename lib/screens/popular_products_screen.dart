import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/get_wishlist.dart';
import 'package:lenzcamera/model/popular_products.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class PopularProductsScreen extends StatefulWidget {
  const PopularProductsScreen({super.key});

  @override
  State<PopularProductsScreen> createState() => _PopularProductsScreenState();
}

class _PopularProductsScreenState extends State<PopularProductsScreen> {
  List<PopularProducts> popularProductsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _popularProducts();
  }

  void _popularProducts() {
    setState(() {
    isLoading = true;
    });

    NetworkManager.shared
        .popularProducts()
        .then((BaseResponse<List<PopularProducts>> response) {
      // print(response.data);
      setState(() {
        isLoading = false;
        popularProductsList.clear();
        popularProductsList.addAll(response.data!);
        // print(response.data!.first.catId);
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
          child: Text('Popular Products'),
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: isLoading?Center(child: CircularProgressIndicator()):Container(
          height: 900,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: popularProductsList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 600,
                  child: Card(
                    child: Column(
                      children: [
                        Stack(children: [
                          Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://dev.lenzcamera.com/webadmin/${popularProductsList[index].imageUrl}"),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: IconButton(
                                onPressed: () {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WishlistScreen(
                                      )));
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Color(0xff70726f),
                                )),
                          ),
                        ]),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                // "CANON EF 16-35 MM F/4L IS USM ",
                                popularProductsList[index].prName ?? '',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Text("QAR${popularProductsList[index].unitPrice ?? ''}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent,
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Center(
                              child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),

      // SizedBox(height: 50),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';

class FeaturedProductsScreen extends StatefulWidget {
  const FeaturedProductsScreen({super.key});

  @override
  State<FeaturedProductsScreen> createState() => _FeaturedProductsScreenState();
}

class _FeaturedProductsScreenState extends State<FeaturedProductsScreen> {
  List<Product> featuredList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _featuredProducts();
  }

  void _featuredProducts() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .featuredProducts()
        .then((BaseResponse<List<Product>> response) {
      print(response.data);
      setState(() {
        isLoading = false;
        featuredList.clear();
        featuredList.addAll(response.data!);
        print(response.data!.first.catId);
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
          child: Text('Featured Products'),
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
      body: isLoading?Center(child: CircularProgressIndicator()):
      Container(
          height: 900,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: featuredList.length,
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
                              child: 
                              CachedNetworkImage(
                                  imageUrl:
                                      "https://dev.lenzcamera.com/webadmin/${featuredList[index].imageUrl}")
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                // "CANON EF 16-35 MM F/4L IS USM ",
                                featuredList[index].prName ?? '',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Text("QAR${featuredList[index].unitPrice ?? ''}",
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

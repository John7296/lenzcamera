import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/screens/wishlist_screen.dart';

class RecentProductsScreen extends StatefulWidget {
  const RecentProductsScreen({super.key});

  @override
  State<RecentProductsScreen> createState() => _RecentProductsScreenState();
}

class _RecentProductsScreenState extends State<RecentProductsScreen> {
  List<Product> recentProductsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _recentProducts();
  }

  void _recentProducts() {
    setState(() {
      isLoading = true;
    });

    NetworkManager.shared
        .recentProducts()
        .then((BaseResponse<List<Product>> response) {
      print(response.data);
      setState(() {
        isLoading = false;
        recentProductsList.clear();
        recentProductsList.addAll(response.data!);
        print(response.data!.first.catId);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void addToWishlist(Product product) {
    NetworkManager.shared
        .addToWishlist(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  void removeFromWishlist(Product product) {
    NetworkManager.shared
        .removeFromWishlist(<String, dynamic>{
          "urlKey": product.urlKey,
          "custId": 386,
          "guestId": "",
        })
        .then((BaseResponse response) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Recent Products'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: 900,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: recentProductsList.length,
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
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "https://dev.lenzcamera.com/webadmin/${recentProductsList[index].imageUrl}")),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (recentProductsList[index]
                                                .isWhishlisted ==
                                            true) {
                                          removeFromWishlist(
                                              recentProductsList[index]);
                                          recentProductsList[index]
                                              .isWhishlisted = false;
                                        } else {
                                          addToWishlist(
                                              recentProductsList[index]);
                                          recentProductsList[index]
                                              .isWhishlisted = true;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: recentProductsList[index]
                                              .isWhishlisted!
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                              ),
                            ]),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    // "CANON EF 16-35 MM F/4L IS USM ",
                                    recentProductsList[index].prName ?? '',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Text(
                                "QAR${recentProductsList[index].unitPrice ?? ''}",
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
              )),

      // SizedBox(height: 50),
    );
  }
}

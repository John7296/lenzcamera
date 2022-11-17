import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/home_screen.dart';

class CategoryMenuScreen extends StatefulWidget {
  const CategoryMenuScreen({super.key});

  @override
  State<CategoryMenuScreen> createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
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
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 120,
                      width: 100,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/lens.png"),
                            height: 100,
                            width: 100,
                          ),
                          Text('CANON EF'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

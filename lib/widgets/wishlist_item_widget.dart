import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishlistItemWidget extends StatefulWidget {
  const WishlistItemWidget({super.key});

  @override
  State<WishlistItemWidget> createState() => _WishlistItemWidgetState();
}

class _WishlistItemWidgetState extends State<WishlistItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage("assets/images/lens.jpg"),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Text('CANON EF 16-35 MM F/4L IS USM',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                       Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Text('QAR 8600.00',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_outline,color: Colors.red),
          
        ),
               IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart,color: Colors.grey),
        ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/cart_screen.dart';
import 'package:lenzcamera/screens/order_details_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('My Orders'),
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
      body:       Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDetailScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
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
                        child: Stack(
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 5),
                              child: Image(
                          image: AssetImage("assets/images/lens.png"),
                          height: 50,
                          width: 50,
                        ),
                            ),
                        Container(
                              height: 16,
                              width: 60,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.red),
                              child: Center(child: Text('Cancelled',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.bold),)),
                            ),
                          ],
                        )
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
                        child: Text('1 Item(s)',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                        Row(
                          children: [
                            Padding(
                            padding: const EdgeInsets.only(top:15),
                            child: Text('26-10-2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(left: 120,top: 15),
                         child: Text("QAR 452",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey.shade600)),
                       )
                          ],
                        )
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => OrderDetailScreen()));
              },
              icon: Icon(Icons.arrow_forward,color: Colors.grey),
              
            ),
                 
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    ),
    );
  }
}

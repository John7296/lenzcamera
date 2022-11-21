import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget{
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: Text("Checkout"),
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
    ),

    body: Padding(
      padding: const EdgeInsets.only(left:15, right:15, top:15),
      child: Stack(
        children: [Container(
          margin: EdgeInsets.only(bottom:70),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                  child: Container(
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(left:10, top:10, right: 20),
                           child: Row(children: [
                            Icon(Icons.location_on, color: Color(0xff717171),),
                  
                            SizedBox(width: 10),
                  
                           Expanded(child: Text("Delivery to", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600),)),
                  
                              SizedBox(width: 150),
                  
                           Text("CHANGE", style: TextStyle(color: Color(0xffec3436), fontSize: 15),),                
                           ],),
                         ),
                  
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:15),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
          
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:5),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 12),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:5),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 12),),
                          ),
                  
                    ]),
                  ),
                  
                  ),
          
                  SizedBox(height: 10,),
          
                  Card(
                    elevation: 2,
                  child: Container(
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(left:10, top:10, right: 20, bottom:10),
                           child: Row(children: [
                            Icon(Icons.location_on, color: Color(0xff717171),),
                  
                            SizedBox(width: 10),
                  
                           Expanded(child: Text("Billing to", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600),)),
                  
                              SizedBox(width: 160),
                  
                           Text("CHANGE", style: TextStyle(color: Color(0xffec3436), fontSize: 15),),                
                           ],),
                         ),
                  
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:15),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
          
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:5),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 12),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only (left:44, top:5),
                            child: Text("Dhffig Yrfud", style: TextStyle(color: Color(0xff717171), fontSize: 12),),
                          ),
                  
                    ]),
                  ),
                  
                  ),
          
                     SizedBox(height: 10,),
          
                  Card(
                    elevation: 2,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left:44, top:10),
                      child: Row(children: [
                       Icon(Icons.circle_outlined, color: Color(0xffe0e0e0),),
                  
                       SizedBox(width: 10),
                  
                      Text("Use my wallet: 0", style: TextStyle(color: Color(0xff717171), fontSize: 12),),        
                    ],
                    ),
                    ),
                  ),
                  ),
                   
                    SizedBox(height: 10,),
          
                   Card(
                    elevation: 2,
                  child: Container(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10, top:10),
                      child: Column(
                        children: [
                          Row(children: [
                           Icon(Icons.payment, color: Color(0xff717171),),
                  
                                SizedBox(width: 10),
                  
                               Text("Choose Payment", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600),),
                  
                           SizedBox(width: 10),
                                                    
                    ],
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top:15),
                      child: Row(children: [
                             CircleAvatar(
                               radius: 10,
                             
                               child: Icon(Icons.circle_outlined, size: 20),
                               ),
                  
                                  SizedBox(width: 10),
                  
                                 Text("Cash on Delivery", style: TextStyle(color: Color(0xff717171), fontSize: 12),),
                  
                             SizedBox(width: 10),                   
                      ],
                      ),
                    ),
                        ],
                      ),
                    ),
                  ),
                  ),
          
                   SizedBox(height: 10,),
          
                     Card(
                    elevation: 2,
                  child: Container(
                    height: 165,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10, top:10),
                      child: Column(
                        children: [
                          Row(children: [
                           Icon(Icons.shopping_cart_outlined, color: Color(0xff717171),),
                  
                                SizedBox(width: 10),
                  
                               Text("Cart Summary", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600),),
                  
                           SizedBox(width: 10),
                                                    
                    ],
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only( left:10,top:15, right: 20),
                      child: Row(
                        children: [
                                  Expanded(child: Text("Subtotal: ", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600),)),
                  
                            //  SizedBox(width: 160),   
                               Text("QAR 549.00 ", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),),                
                      ],
                      ),
                    ),
          
                     SizedBox(height:10),
          
                    Divider(color: Colors.black,
                    indent: 10,
                    endIndent: 20,
                    thickness: 0.75,
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only( left:10,top:10, right: 20),
                      child: Row(
                        children: [
                                  Expanded(child: Text("Total ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),)),
                  
                            //  SizedBox(width: 175),   
                               Text("QAR 549.00 ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),                
                      ],
                      ),
                    ),
          
                    
                     SizedBox(height:10),
          
                    Divider(color: Colors.black,
                    indent: 10,
                    endIndent: 20,
                    thickness: 0.75,
                    ),
                        ],
                      ),
                    ),
                  ),
                  ),
                 
                  SizedBox(height:10),
      
                     Card(
                      elevation: 2,
                       child: Container(
                        height: 170,
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left:10, top:10),
                               child: Row(children: [
                                 Icon(Icons.note),
      
                                 SizedBox(width: 10),
      
                                 Text("Order Note", style: TextStyle(color: Color(0xff717171), fontSize: 12, fontWeight: FontWeight.w600))
                               ],),
                             ),
      
                             SizedBox(height: 50),
      
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: TextField(
                               maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none
                                ),
                               ),
                             )
                           ],
                         ),
                       ),
                      
                     ),
          
              ],),
            ),
          ),
        ),
         
         Align(
          alignment: Alignment.bottomCenter,
           child: Padding(
             padding: const EdgeInsets.only(bottom:10.0),
             child: Container(
                 height: 40,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Color(0xffec3436),
                   ),
                   onPressed: () {
                     // Navigator.push(
                     // context,
                     // MaterialPageRoute(
                     // builder: (context) =>
                     // ReviewScreen()));
              
                   },
                   child: Center(
                       child: Text(
                         "PLACE ORDER",
                         style: TextStyle(fontSize: 20, color: Colors.white),
                       )),
                 ),
               ),
           ),
         ), 

        ]
      ),
    ),
    );
  }
}
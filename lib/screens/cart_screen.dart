import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/order_screen.dart';

class CartScreen extends StatefulWidget{
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f8f6),
      appBar: AppBar(
         centerTitle: true,
        title: Text("Cart"),
         titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {Navigator.pop(context);},
          ),
          backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:5,right:5,top:10, bottom: 10),
        child: Stack(
          children: [Container(
            margin: EdgeInsets.only(bottom: 70),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                   height: 110,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.green,
                   ),
                      //color: Colors.green,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index){
                    
                   return Column(
                     children: [
                       Container(
                        height: 120,
                         child: Card(
            
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height:100,
                                          child: Image(image: AssetImage("assets/images/lens.png"))),
                                      ),                       
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Row(
                                      children: [
                                        Text("CANON LP-E6NH BATTERY(OG)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600), maxLines: 2),
                                    
                                        IconButton(onPressed: (){}, icon: Icon(Icons.delete_outlined, color: Colors.red,))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("QAR 549.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600), maxLines: 2),
                                      
                                      SizedBox(
                                        width: 90,
                                      ),
                                      
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff70726f),
                                              borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(5),
                                               bottomLeft: Radius.circular(5), 
                                              )
                                            ),
                                            child: Center(child: Icon(Icons.remove, color: Colors.white, size: 12,)),),
                                       Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                              color: Color(0xffe3e3e3),                                
                                              ),
                                              child: Center(child: Text("1", style: TextStyle(color: Colors.black),)),
                                            ),
                                         Container(
                                          width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                              color: Color(0xffe83031), 
                                              borderRadius: BorderRadius.only(
                                               topRight: Radius.circular(5),
                                               bottomRight: Radius.circular(5), 
                                              )                               
                                              ),
                                             child: Icon(Icons.add, color: Colors.white, size: 12,)),
                                       
                                          ],
                                       ),
                                            
                                      ],
                                    ),
            
                                  ],)
                                ],
                              ),
                            ],
                          ),
                          
                         ),   
                       ),
                     ],
                   );
            
                  }),
                ),
            
                SizedBox(height: 400,),
            
              Container(
                height: 60,
                decoration:BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
                child: Row(
                  children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10, top:10, right:10),
                          child: Row(
                            children: [
                              
                              Text("Subtotal: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                              SizedBox(
                                width: 220,
                              ),
                              Text("QAR 549.00 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                              
                            ],
                          ),
                        ),
                      
                          Padding(
                            padding: const EdgeInsets.only( left:10, top:5, right:10),
                            child: Row(
                              children: [
                        Text("Delivery: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                         SizedBox(
                                  width: 240,
                                ),
                               Text("QAR 0.00 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                      
                      ],),
                          ),
                      
                      ],),              
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),


              Container(height: 60,
              decoration:BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:10),
                child: Row(children: [
                     Text("Total: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),

                      SizedBox(
                                    width: 240,
                                  ),
                                 Text("QAR 559.00 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                ]),
              ),
              ),
            
              
              ]),
            ),
          ),

           Align(
            alignment: Alignment.bottomCenter,
             child: Container(
                             height: 50,
                             child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Color(0xff444444),
                               ),
                               onPressed: () {
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                     builder: (context) =>
                                     OrderScreen()));
                       
                               },
                               child: Center(
                                   child: Text(
                                 "PROCEED TO CHECKOUT",
                                 style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                               )),
                             ),
                           ),
           ),
          ],
        ),
      ),
    );
  }
}
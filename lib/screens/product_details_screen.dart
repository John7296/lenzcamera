import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/screens/write_review_screen.dart';

class ProductDetailsScreen extends StatefulWidget{
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(appBar: AppBar(
    centerTitle: true,
    title: Text("Product Details"),
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
          Icon(Icons.favorite_border_outlined, color: Colors.white,),
         SizedBox(width:40),
          Icon(Icons.shopping_cart_outlined, color: Colors.white,),
           SizedBox(width:20),
        ],
    ),
    body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 70),
          child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: Column(
              children: [
                Center(
                  child: Container(
                   
                    width: 250,
                    child: Image(
                              image: AssetImage("assets/images/lens.png"),
                            ),
                )
                ),
                Divider(
                  thickness: 5,
                  color: Color(0xffe3e3e3),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:24, right: 24, top: 5, bottom: 5),
                  child: Row(children: [
                    Expanded(child: Text("CANON EF 16-35MM F/2.8L III USM  " ,style: TextStyle(color: Color(0xff6e706d), fontSize: 20, fontWeight: FontWeight.w600), maxLines: 2,)),
                    SizedBox(width:50),
                   IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Color(0xff70726f),)),
                  ],),
                ),
                 Divider(
                  thickness: 5,
                  color: Color(0xffe3e3e3),
                ),
               
                 Padding(
                  padding: const EdgeInsets.only(left:24, right: 24, top:5, bottom: 5),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Canon EF 16-35mm f/2.8L III USM Lens  " ,style: TextStyle(color: Color(0xff6e706d), fontSize: 12, fontWeight: FontWeight.w500), maxLines: 1,)),
                          SizedBox(height: 7),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("DSLR Lenses",style: TextStyle(color: Color(0xff5aa567), fontSize: 12, fontWeight: FontWeight.w500), )),
                              Align(
                                alignment:Alignment.centerRight,
                              child: IconButton(onPressed: (){}, icon:Icon(Icons.share, color:Color(0xff70726f),),)),
      
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("QAR 6899.00",style: TextStyle(color: Color(0xff6e706d), fontSize: 17, fontWeight: FontWeight.w600) ))
                    ],
                  ),
                ),
                Divider(
                  thickness: 9,
                  color: Color(0xffe3e3e3),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.only(left:270, bottom: 5),
                  child: Container(
                    height: 25,
                    width: 80,
                               child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Color(0xffec3436),
                                 ),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                       builder: (context) =>
                                       WriteReviewScreen()));
                         
                                 },
                                 child: Center(
                                     child: Text(
                                   "Reviews",
                                   style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                 )),
                               ),

                  ),
                ),

                 Divider(
                  thickness: 9,
                  color: Color(0xffe3e3e3),
                ),
    
                
      
                Padding(
                  padding: const EdgeInsets.only(left:24, right: 24, top:10, bottom: 5),
                  child: Column(children: [
                    Row(
                      children: [
                        Text("Product Details", style: TextStyle(color: Color(0xff6e706d), fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(height: 10),
                     Padding(
                       padding: const EdgeInsets.only(left: 12),
                       child: Row(
                        children: [
                          Text("Key Features", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                        ],
                    ),  
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, top:30),
                       child: Row(
                         children: [
                           Text(". EF Mount Lens/ Full Frame Format", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, top:5),
                       child: Row(
                         children: [
                           Text(". EF Mount Lens/ Full Frame Format", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, top:5),
                       child: Row(
                         children: [
                           Text(". EF Mount Lens/ Full Frame Format", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, top:5),
                       child: Row(
                         children: [
                           Text(". EF Mount Lens/ Full Frame Format", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, top:5, bottom: 5),
                       child: Row(
                         children: [
                           Text(". EF Mount Lens/ Full Frame Format", style: TextStyle(color: Color(0xff6e706d), fontSize: 13, fontWeight: FontWeight.w300)),
                         ],
                       ),
                     ),
                        
                     
                  ],),
                ),
      
                 Divider(
                  thickness: 5,
                  color: Color(0xffe3e3e3),
                ),
      
                Padding(
                  padding: const EdgeInsets.only(left:24, right: 24, top:5, bottom: 5),
                  child: Row(children: [
                    Text("Related Products",style: TextStyle(color: Color(0xff6e706d), fontSize: 15, fontWeight: FontWeight.w600),),
                  ],),
                ),
    
                Padding(
                  padding: const EdgeInsets.only(left:24, right:24, top:5),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children : [
                          Expanded(
                            child: Container(
                              height: 280,
                              
                             //color: Colors.green,
                             child: ListView.builder(
                               scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index){
                                 return Card(
                                  child: Container(
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children:[ 
                                            Center(
                                            child: Container(
                                              width: 150,
                                              child: Image(image: AssetImage("assets/images/lens.png")),
                                            ),
                                          ),
                                                    
                                        Padding(
                                          padding: const EdgeInsets.only(left: 140),
                                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite, color: Color(0xff70726f),) ),
                                        ),
                                      ]
                                    ),
                                                          
                                    Padding(
                                      padding: const EdgeInsets.only(left:10, right: 10),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("CANON EF 16-35 MM F/4L IS USM ", style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400), maxLines: 2, textAlign: TextAlign.center,)),
                                    ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top:7),
                                            child: Text("QAR 39999.00", style:TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                          )),
                                              
                                                     Padding(
                                                       padding: const EdgeInsets.only(left:10, right:10, top:5, bottom:5),
                                                       child: Container(
                                                               height: 35,
                                                               width:200,
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.yellowAccent,
                                                            ),
                                                            onPressed: () {},
                                                            child: Center(
                                                                child: Text(
                                                              "ADD",
                                                              style: TextStyle(fontSize: 18, color: Colors.black),
                                                            )),
                                                          ),
                                                        ),
                                                     ), 
                                              
                                     
                                    
                                      ],
                                    ),
                                  ),
                              );
                              }
                                           
                                                            
                            ),
                            ),
                          ),
                          
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      
              ],
            ),
          ),
      ),
        ),
      
      Align(
          alignment: Alignment.bottomCenter,
           child: Padding(
             padding: const EdgeInsets.only(bottom:10.0, left:24, right: 24),
             child: Container(
                 height: 50,
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
                         "Add To Cart",
                         style: TextStyle(fontSize: 20, color: Colors.white),
                       )),
                 ),
               ),
           ),
         ), 

      ],
    ),
    
  
    ),
    );
  }
}
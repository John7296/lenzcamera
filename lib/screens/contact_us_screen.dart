import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget{
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
     body: Container(
      color: Colors.white,
       child: Padding(
         padding: const EdgeInsets.only(left:24, right:24 , top: 40),
         child: Column(
           children: [
             SingleChildScrollView(
               child: Column(children: [
                 Card(
                  child: Container(
                  height:220,
                     child: Stack(
                       children: [ Padding(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Office",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff70706f)), ),
                              ],
                            ),
                     
                            Padding(
                              padding: const EdgeInsets.only(left:8, top:5),
                              child: Row(
                                children: [
                                  Text("Al Aaliya St, ",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                                ],
                              ),
                            ),
                          
                          
                           Padding(
                             padding: const EdgeInsets.only(left:8, top:5),
                             child: Row(
                               children: [
                                 Text("Doha,,",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                               ],
                             ),
                           ),
                
                            Padding(
                             padding: const EdgeInsets.only(left:8, top:5),
                             child: Row(
                               children: [
                                 Text("Qatar,",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                               ],
                             ),
                           ),
                       
                       
                          Padding(
                            padding: const EdgeInsets.only(left:8, top:20),
                            child: Row(
                              children: [
                                Text("info@demo.com",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd0393f)),maxLines: 3, ),
                              ],
                            ),
                          ),
               
                          Padding(
                            padding: const EdgeInsets.only(left:8, top:20),
                            child: Row(
                              children: [
                                Text("+974 5578 2553",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd0393f)),maxLines: 3, ),
                              ],
                            ),
                          ),
                          ],
                           ),
                       ),
               
                       Column(children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 300, top: 20),
                            child: Row(children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.phone, size: 50, color: Color(0xff70706f),)),                  
                              ]),
                      ),
                    ),
               
                         Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 300, top: 10),
                            child: Row(children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.mail, size: 50, color: Color(0xff70706f),)),
                              ]),
                         ),
                         ),
               
                         Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 300, top:10),
                            child: Row(children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp, size: 50, color: Color(0xff70706f),)),
                              ]),
                          ),
                          ),
                         ],),
                       ]
                     )
                    ),
                 ),
                
                SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email ID",
                          style: TextStyle(
                              color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: " ",
                      )),
             
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Phone +974",
                          style: TextStyle(
                              color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: " ",
                      )),
             
                       SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Title",
                          style: TextStyle(
                              color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: " ",
                      )),
             
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Message",
                          style: TextStyle(
                              color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                          decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(vertical: 80.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb0b0b0)),
                        ),
                        labelText: " ",
                      )),
               ],),
             ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 70),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color(0xffec3436),
            //     ),
            //     onPressed: () {
            //       // Navigator.push(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //     builder: (context) =>
            //       //     ForgotPasswordScreen()));
          
            //     },
            //     child: Center(
            //         child: Text(
            //       "Sign In",
            //       style: TextStyle(fontSize: 20, color: Colors.white),
            //     )),
            //   ),
            // ),
           ],
         ),
         
       ),
       
     ),
    ),
   );
  }
}
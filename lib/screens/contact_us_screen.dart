
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/customer_details.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class ContactUsScreen extends StatefulWidget{
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  // LoginCustomer? user;






void showFlashMsg(String msg, {Color color = const Color(0xFF272532)}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[2],
         // backgroundColor: Colors.grey,
          reverseAnimationCurve: Curves.easeInCirc,
          forwardAnimationCurve: Curves.easeInOutBack,
          margin: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(6.0),    
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              msg,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
        );
      },
    );
  }

   void customerDetails() {
    NetworkManager.shared
        .customerDetails(NetworkManager.shared.userId)
        .then((BaseResponse<LoginCustomer> response) {
      var thisUser = response.data!;


      _emailController.text = thisUser.emailId ?? "";
      _phoneController.text = thisUser.phoneNo ?? "";
     
    }).catchError((Object obj) {});
  }

void onSendButtonTapped() {

  Map<String, dynamic> map = {
      
      "custId": NetworkManager.shared.userId,
     'email' : _emailController.text,
     'phone' : _phoneController.text,
     ' title' : _titleController.text,
      'message' :_messageController.text,
  };
    NetworkManager.shared.supportMessageSend(map).then((BaseResponse response) {
  
       _emailController.text = "";
      _phoneController.text  = "";
      _titleController.text = "";
      _messageController.text = "";

      showFlashMsg(response.message!);
      
    }).catchError((Object obj) {
     
    });
  }

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    appBar: AppBar(
       centerTitle: true,
        title: Text("Support"),
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
     body: Container(
      color: Colors.white,
       child: Stack(
         children:[ Padding(
           padding: const EdgeInsets.only(left:24, right:24 , top: 30),
           child: Container(
            margin: EdgeInsets.only(bottom:70),
             child: SingleChildScrollView(
               child: Column(children: [
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white
                      )
                    ]
                  ),
                   child: Card(
                    elevation: 2,
                    child: Stack(
                      children: [ Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                         children: [
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left:10),
                                 child: Text("Office",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff70706f)), ),
                               ),
                             ],
                           ),
                    
                           Padding(
                             padding: const EdgeInsets.only(left:15, top:5),
                             child: Row(
                               children: [
                                 Text("Al Aaliya St, ",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                               ],
                             ),
                           ),
                         
                         
                          Padding(
                            padding: const EdgeInsets.only(left:15, top:5),
                            child: Row(
                              children: [
                                Text("Doha,",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                              ],
                            ),
                          ),
                
                           Padding(
                            padding: const EdgeInsets.only(left:15, top:5),
                            child: Row(
                              children: [
                                Text("Qatar,",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff70706f)),maxLines: 3, ),
                              ],
                            ),
                          ),
                      
                      
                         Padding(
                           padding: const EdgeInsets.only(left:15, top:20),
                           child: Row(
                             children: [
                               Text("info@demo.com",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd0393f)),maxLines: 3, ),
                             ],
                           ),
                         ),
               
                         Padding(
                           padding: const EdgeInsets.only(left:15, top:20),
                           child: Row(
                             children: [
                               Text("+974 5578 2553",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd0393f)),maxLines: 3, ),
                             ],
                           ),
                         ),
                         ],
                          ),
                      ),
               
                      Column(
                       crossAxisAlignment:CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        
                       Container(
                         child: Padding(
                           padding: const EdgeInsets.only( top: 10, right:24 ),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             IconButton(onPressed: (){}, icon: Icon(Icons.phone, size: 50, color: Color(0xff70706f),)),                  
                             ]),
                     ),
                      ),
               
                        Container(
                         child: Padding(
                           padding: const EdgeInsets.only(right: 24, top: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             IconButton(onPressed: (){}, icon: Icon(Icons.mail, size: 50, color: Color(0xff70706f),)),
                             ]),
                        ),
                        ),
               
                        Container(
                         child: Padding(
                           padding: const EdgeInsets.only(right: 24, top:10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp, size: 50, color: Color(0xff70706f),)),
                             ]),
                         ),
                         ),
                        ],),
                      ]
                    ),
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
                      Container(
                        height: 40,
                        child: TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: " ",
                        ),
                        controller: _emailController,
                        validator: (val) {
                                    if (val!.isEmpty)
                                      return "Enter your first name";
                                    return null;
                                  }),
                      ),
             
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
                      Container(
                        height: 40,
                        child: TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: " ",
                        ),
                        
                        controller: _phoneController,
                        validator: (val) {
                                    if (val!.isEmpty)
                                      return "Enter your phoneNo";
                                    return null;
                                  }
                        
                        
                        ),
                      ),
             
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
                      Container(
                        height: 40,
                        child: TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: " ",
                        ),
                        controller: _titleController,
                        validator: (val) {
                                    if (val!.isEmpty)
                                      return "Enter title";
                                    return null;
                                  }
                        
                        
                        ),
                      ),
             
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
                      Container(
                        height: 90,
                        child: TextFormField(
                            decoration: InputDecoration(
                               contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffb0b0b0)),
                          ),
                          labelText: " ",
                        ),
                        controller: _messageController,
                        validator: (val) {
                                    if (val!.isEmpty)
                                      return "Enter your message";
                                    return null;
                                  }
                        
                        ),
                      ),
                    SizedBox(height: 150),
               ],),
             ),
           ),
           
         ),
         Align(
          alignment: Alignment.bottomCenter,
           child: Padding(
             padding: const EdgeInsets.only(left:24, right:24, bottom: 8),
             child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec3436),
                      ),
                      onPressed: () {

                       //onSendButtonTapped();
                        print("/////////////////");

                        print(SessionsManager.userId);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //     builder: (context) =>
                        //     ForgotPasswordScreen()));
              
                      },
                      child: Center(
                          child: Text(
                        "Send Message",
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
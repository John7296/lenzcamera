
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget{ 
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

   bool? isExpanded;

         double _startValue = 499;
          double _endValue = 8200;

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text("Filter"),
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
        padding: const EdgeInsets.only(left:24, right: 24),
        child: Stack(
          children:[ Container(
            margin: EdgeInsets.only(bottom:75),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 15),
                 Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color:  Color(0xffadadad),
                     child: ExpansionTile(
                               title: Text('Categories'),
                              // collapsedBackgroundColor: Color(0xffadadad),
                               backgroundColor: Color(0xffadadad),
                               collapsedTextColor: Colors.black,
                     
                               // Contents
                               children: [
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "Lenses", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                           
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:20),
                       child: Text( "DSLR Lenses", style: TextStyle(color: Color(0xffec3436)),),
                     ),),

                               ],
                     ),
                   ),
                       
                            
                 SizedBox(height: 12),
                 Container(
                  height:60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color:  Colors.grey,
                  ),
                    child: Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Text("Price Range"),
                          ),
                        ],
                      ),
                    ),          
                 ),
                 SizedBox(
                  height: 20,
                 ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top:30),
                  child: SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                    child: RangeSlider(
                              min: 499,
                              max: 8200,
                              divisions: 8200,
                              activeColor: Color(0xffea3438),
                              inactiveColor: Color(0xff6f7270),
                              labels: RangeLabels(
                                _startValue.round().toString(),
                                 _endValue.round().toString(),
                              ),
                              values: RangeValues(_startValue, _endValue),
                              onChanged: (values) {
                                setState(() {
                    _startValue = values.start;
                    _endValue = values.end;
                                });
                              },
                              ),
                  ),
                ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color:  Color(0xffadadad),
                     child: ExpansionTile(
                               title: Text('Brand'),
                              // collapsedBackgroundColor: Color(0xffadadad),
                               backgroundColor: Color(0xffadadad),
                               collapsedTextColor: Colors.black,
                     
                               // Contents
                               children: [
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "CANON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                           
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "NIKON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),

                      ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "SIGMA", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                      ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "TAMRON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                               ],
                     ),
                   ),
                     SizedBox(
                      height:12
                     ),
              
                   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color:  Color(0xffadadad),
                     child: ExpansionTile(
                               title: Text('Manufacturer'),
                              // collapsedBackgroundColor: Color(0xffadadad),
                               backgroundColor:  Color(0xff70726f),
                               collapsedTextColor: Colors.black,
                     
                               // Contents
                               children: [
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "CANON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                           
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "NIKON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),

                      ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "SIGMA", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                      ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left:15),
                       child: Text( "TAMRON", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                               ],
                     ),
                   ),
              
                 SizedBox(
                      height:12
                     ),
                   
            
                  
                    
                   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color:  Color(0xffadadad),
                     child: ExpansionTile(
                               title: Text('Lens Mount'),
                              // collapsedBackgroundColor: Color(0xffadadad),
                               backgroundColor: Color(0xffadadad),
                     
                               // Contents
                               children: [
                                 ListTile(
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(5),
                                   bottomRight: Radius.circular(5))),
                                 tileColor:Color(0xffe3e3e3),
                                  // Color(0xffe3e3e3),
                     title: Padding(
                       padding: const EdgeInsets.only(left: 15),
                       child: Text( "Canon EF", style: TextStyle(color: Color(0xffec3436)),),
                     ),),
                           
                                 ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
                     tileColor: Color(0xffe3e3e3),
                       title: Padding(
                         padding: const EdgeInsets.only(left: 15),
                         child: Text( "Nikon F", style: TextStyle(color: Color(0xffec3436)),),
                       ),),
                               ],
                     ),
                   ),
            
                //       Container(
                //  height: 60,
                //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                //  color: Colors.grey,
                //  ),
                 
                //  child:ExpansionTile(
                //         backgroundColor:  Color(0xffadadad),
                //         title: Text("Lens Mount"),
                //         trailing: Icon(Icons.arrow_drop_down_outlined),
                //      children: [
            
                //       ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.blue,
                //     ),
                      //  Column(
                      //    mainAxisSize: MainAxisSize.min,
                      //    children: [
                      //      Expanded(
                      //        child: Container(
                      //          height: 50,
                      //          color: Color(0xffadadad),
                      //          child: Column(children: [
                      //            Row(children: [
                      //              Text(",mvvfdv"),
                      //            ],),
                      //            Row(children: [
                      //              Text(",mvvfdv"),
                      //            ],)
                      //          ]),
                      //        ),
                      //      ),
                      //    ],
                      //  ), 
                    
                  //    ],
                       
                  //            ),   
                  //  ),
                  
                  SizedBox(
                    height: 200,
                  ),
                                 
            ],
        ),
            ),
          ),

           Align(
                  alignment: Alignment.bottomCenter,
                   child: Container(
                         height: 75,
                         //color: Color(0xfff2f2f2),
                          child: Row(children: [
                           Container(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                          backgroundColor:  Color(0xff70726f),
                        ),
                             onPressed: (){}, child: 
                             Text("CLEAR", style: TextStyle(fontSize: 20),),),
                           ),
                           SizedBox(width: 10,),
                           Expanded(
                             child: Container(
                    height: 40,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffec3436),
                        ),
                      onPressed: (){}, child: 
                    Text("APPLY", style: TextStyle(fontSize: 20),),
                   
                    ),
                             ),
                           ),
                           
                   ],),
                   ),
                 ),
          ],
      ),
      ),
    );
  }
}
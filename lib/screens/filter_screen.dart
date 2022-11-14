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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text("Filter"),
         titleTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:24, right: 24),
        child: Column(children: [
          SizedBox(height: 15),
            Container(
           height: 60,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
           color: Color(0xffadadad),
           ),
           
           child:ExpansionTile(
                  backgroundColor:  Color(0xffadadad),
                  title: Text("Categories"),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
               children: [
                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Expanded(
                       child: Container(
                         height: 150,
                         color: Color(0xffadadad),
                         child: Column(children: [
                           Row(children: [
                             Text(",mvvfdv"),
                           ],),
                           Row(children: [
                             Text(",mvvfdv"),
                           ],)
                         ]),
                       ),
                     ),
                   ],
                 ), 
              
               ],
                 
                       ),           ),
           SizedBox(height: 12),
           Container(
            height:60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            color:  Color(0xffe3e3e3),
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RangeSlider(
  min: 499,
  max: 8200,
  activeColor: Color(0xffea3438),
  inactiveColor: Color(0xff6f7270),
  values: RangeValues(_startValue, _endValue),
  onChanged: (values) {
    setState(() {
      _startValue = values.start;
      _endValue = values.end;
    });
  },
),
          ),
      SizedBox(height: 20),
      Container(
           height: 60,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
           color: Color(0xffadadad),
           ),
           
           child:ExpansionTile(
                  backgroundColor:  Color(0xffadadad),
                  title: Text("Brand"),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
               children: [
                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Expanded(
                       child: Container(
                         height: 150,
                         color: Color(0xffadadad),
                         child: Column(children: [
                           Row(children: [
                             Text(",mvvfdv"),
                           ],),
                           Row(children: [
                             Text(",mvvfdv"),
                           ],)
                         ]),
                       ),
                     ),
                   ],
                 ), 
              
               ],
                 
                       ),   
               ),
               SizedBox(
                height:12
               ),

       Container(
           height: 60,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
           color: Color(0xffadadad),
           ),
           
           child:ExpansionTile(
                  backgroundColor:  Color(0xffadadad),
                  title: Text("Manufacturer"),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
               children: [
                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Expanded(
                       child: Container(
                         height: 150,
                         color: Color(0xffadadad),
                         child: Column(children: [
                           Row(children: [
                             Text(",mvvfdv"),
                           ],),
                           Row(children: [
                             Text(",mvvfdv"),
                           ],)
                         ]),
                       ),
                     ),
                   ],
                 ), 
              
               ],
                 
                       ),   
       ),

           SizedBox(
                height:12
               ),

       Container(
           height: 60,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
           color: Color(0xffadadad),
           ),
           
           child:ExpansionTile(
                  backgroundColor:  Color(0xffadadad),
                  title: Text("Lens Mount"),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
               children: [
                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Expanded(
                       child: Container(
                         height: 150,
                         color: Color(0xffadadad),
                         child: Column(children: [
                           Row(children: [
                             Text(",mvvfdv"),
                           ],),
                           Row(children: [
                             Text(",mvvfdv"),
                           ],)
                         ]),
                       ),
                     ),
                   ],
                 ), 
              
               ],
                 
                       ),   
       ),

       Spacer(),
     
       Container(
        height: 75,
        color: Color(0xfff2f2f2),
         child: Row(children: [
          Container(
           height: 60,
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
              height: 60,
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
       )

       
        ],
            ),
      ),
      ),
    );
  }
}
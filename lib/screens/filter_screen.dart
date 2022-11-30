import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/filter_products.dart';
import 'package:lenzcamera/model/filter_response.dart';

List<String> _categories = <String>['Canon', 'Nikon', 'Sigma', 'Tamron'];

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? isExpanded;

  double _startValue = 499;
  double _endValue = 8200;

  String? dropdownValue;


   bool isLoading = false;
  int currentPage = 1;

   List<FilterProducts> _products = [];

   @override
  void initState() {
    super.initState();
  
  }
 

   void searchFilter(){
    setState(() {
      isLoading = true;
   
    });

    NetworkManager.shared.searchFilter(<String, dynamic>{
      "currentpage": 1,
       "custId": 386, 
       "filter": {"category": "dslr-lenses"}, 
       "filtervalues": null, 
       "guestId": null, 
       "maxPrice": "1000000", 
       "minPrice": "0", 
       "pagesize": 20,
        "searchstring": "",
         "sortorder": {"direction": "default", "field": "prName"},
          "status": false, 
          "vendorUrlKey": 8
    }).then((BaseResponse<FilterResponse>response) {
       setState(() {
            isLoading= false;    
      });
    }).catchError((e) {
    print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 75),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:  Color(0xff6f7270),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, right:10),
                        child: DropdownButton(
                          hint: Text("Categories"),
                          underline: Container(color: Colors.transparent),
                          isExpanded: true,
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (String? value) {
                            searchFilter();
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          items:
                              _categories.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: 
                              
                              Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    //  ExpansionTile(

                    //            title: Text('Categories'),
                    //           // collapsedBackgroundColor: Color(0xffadadad),
                    //            backgroundColor: Color(0xffadadad),
                    //            collapsedTextColor: Colors.black,

                    //            // Contents
                    //            children: [
                    //              ListTile(
                    //                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    //    bottomLeft: Radius.circular(5),
                    //                bottomRight: Radius.circular(5))),
                    //              tileColor:Color(0xffe3e3e3),
                    //               // Color(0xffe3e3e3),
                    //  title: Padding(
                    //    padding: const EdgeInsets.only(left:15),
                    //    child: Text( "Lenses", style: TextStyle(color: Color(0xffec3436)),),
                    //  ),),

                    //              ListTile(
                    //                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    //    bottomLeft: Radius.circular(5),
                    //                bottomRight: Radius.circular(5))),
                    //              tileColor:Color(0xffe3e3e3),
                    //               // Color(0xffe3e3e3),
                    //  title: Padding(
                    //    padding: const EdgeInsets.only(left:20),
                    //    child: Text( "DSLR Lenses", style: TextStyle(color: Color(0xffec3436)),),
                    //  ),),

                    //            ],
                    //  ),
                    //),

                    SizedBox(height: 13),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff6f7270),
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Price Range"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    SizedBox(height: 13),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:  Color(0xff6f7270),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, right:10),
                        child: DropdownButton(
                          hint: Text("Brand"),
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          items:
                              _categories.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: 
                              
                              Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),

                   Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:  Color(0xff6f7270),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, right:10),
                        child: DropdownButton(
                          hint: Text("Manufacturer"),
                          isExpanded: true,
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: dropdownValue,
                        underline: Container(color: Colors.transparent),
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          items:
                              _categories.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: 
                              
                              Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: 13),

                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:  Color(0xff6f7270),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, right:10),
                        child: DropdownButton(
                          hint: Text("Lens Mount"),
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          items:
                              _categories.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: 
                              
                              Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

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
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff70726f),
                        ),
                        onPressed: () {},
                        child: Text(
                          "CLEAR",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffec3436),
                          ),
                          onPressed: () {},
                          child: Text(
                            "APPLY",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

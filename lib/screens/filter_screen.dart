import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/attribute.dart';

import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/category.dart';
import 'package:lenzcamera/model/filter_data.dart';

import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/search_filter_response.dart';

 //List<String> _categories = <String>['Canon', 'Nikon', 'Sigma', 'Tamron'];

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? isExpanded;

  double _startValue = 499;
  double _endValue = 7999;

  Category? selectedCategory;
   Attribute? selectedAttribute;
     Attribute? selectedBrand;
         Attribute? selectedManufacturer;
          Attribute? selectedLens;

      SearchFilterResponse? price;

   bool isLoading = false;
  int currentPage = 1;

  List<Category>_categoryList =[];
  List<Attribute>_attributeList =[];



   @override
  void initState() {
    super.initState();
    searchFilter();
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
      
    }).then((BaseResponse<SearchFilterResponse>response) {
       setState(() {
            isLoading= false;  
             _categoryList.clear();
             _attributeList.clear();
        _categoryList.addAll(response.data!.categoryList!);  
        _attributeList.addAll(response.data!.attributes!);  
      });
    }).catchError((e) {
    print(e.toString());
    });
  }


  List<Attribute> searchAttribute(String attName){

  List<Attribute> attributeValues = [];

     for (Attribute element in _attributeList){
      if(element.attrName==attName){
         attributeValues.add(element);
      }
        
     }
     return attributeValues;
    
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 75),
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
                        child: DropdownButton<Category>(
                          hint: Text("Categories"),
                          underline: Container(color: Colors.transparent),
                          isExpanded: true,
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: selectedCategory,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (Category? value) {
                            
                            // This is called when the user selects an item.
                            setState(() {
                              selectedCategory= value;
                            });
                          },
                          items:
                              _categoryList.map<DropdownMenuItem<Category>>((Category value) {
                            return DropdownMenuItem<Category>(
                              value: value,
                              child: Text(value.catName??''),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            
            
                    SizedBox(height: 13),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff6f7270),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Price Range"),
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
                        child: DropdownButton<Attribute>(
                          hint: Text("Brand"),
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: selectedBrand,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (Attribute? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedBrand = value;
                            });
                          },
                          items:
                              searchAttribute("Brand").map<DropdownMenuItem<Attribute>>((Attribute value) {
                            return DropdownMenuItem<Attribute>(
                              value: value,
                              child: 
                              
                              Text(value.attrValue??''),
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
                        child: DropdownButton<Attribute>(
                          hint: Text("Manufacturer"),
                          isExpanded: true,
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: selectedManufacturer,
                        underline: Container(color: Colors.transparent),
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (Attribute? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedManufacturer = value;
                            });
                          },
                          items:
                              searchAttribute("Manufacturer").map<DropdownMenuItem<Attribute>>((Attribute value) {
                            return DropdownMenuItem<Attribute>(
                              value: value,
                              child: 
                              
                              Text(value.attrValue??''),
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
                        child: DropdownButton<Attribute>(
                          hint: Text("Lens Mount"),
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          dropdownColor: Color(0xffadadad),
                          elevation: 5,
                          value: selectedLens,
                          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                          onChanged: (Attribute? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedLens = value;
                            });
                          },
                          items:
                              searchAttribute("Lens Mount").map<DropdownMenuItem<Attribute>>((Attribute value) {
                            return DropdownMenuItem<Attribute>(
                              value: value,
                              child: 
                              
                              Text(value.attrValue??''),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            
                  
                  ],
                ),
              ),
            ),
            Container(
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
                      onPressed: () {
                      },
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
                        onPressed: () {
                         FilterData? filterData= FilterData();
                         filterData.maxPrice=_endValue;
                         filterData.minPrice = _startValue;
                         filterData.category=selectedCategory;
                         filterData.brand= selectedBrand;
                         filterData.manufacturer=selectedManufacturer;
                         filterData.lensMount=selectedLens;

                         DataManager.shared.filterData=filterData;
                         
                         Navigator.pop(context);
                        },
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
          ],
        ),
      ),
    );
  }
}

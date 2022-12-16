import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/state_list.dart';
import 'package:lenzcamera/model/user_location.dart';
import 'package:lenzcamera/screens/home_screen.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  List<Location> locationList = [];

  var items = ["India", "USA", "Brazil", "Canada", "Australia"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
  }

  void location() {
    NetworkManager.shared
        .custLocation("m")
        .then((BaseResponse<List<Location>> response) {
      setState(() {
        locationList.clear();
        locationList.addAll(response.data!);
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownSearch<String>(
                //mode of dropdown
                mode: Mode.DIALOG,
                //to show search box
                showSearchBox: true,
                showSelectedItem: true,
                //list of dropdown items
                items: items,
                
          //       List<Location>.map((map) {
          //   return DropdownMenuItem(
          //     child: Text(map['name']),
          //     value: map['value'],
          //   );
          // }).toList(),
    
                label: "Country",
                onChanged: print,
                //show selected item
                selectedItem: "India",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  location();
                },
                child: Text("Click"))
          ],
        ),
      ),
    );
  }
}

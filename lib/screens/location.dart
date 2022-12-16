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
  final _TextController = TextEditingController();
  Location? showSelectedState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
  }

  List<Location>? showCityList(String place) {
    List<Location> newLocationList = [];

    for (Location element in newLocationList) {
      if (element.place == place) {
        newLocationList.add(element);
      }
    }
    return newLocationList;
  }

  void location() {
    print(_TextController.text);
    NetworkManager.shared
        .custLocation('b')
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
            SizedBox(
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: 'Email ID'
                ),
                controller: _TextController,
                // validator: (value) {
                //   if (value!.isEmpty) return "Enter your Email ID";
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<Location>(
                hint: Text("Select State"),
                isExpanded: true,
                dropdownColor: Color(0xffadadad),
                elevation: 5,
                value: showSelectedState,
                underline: Container(color: Colors.transparent),
                icon: const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.black,
                ),
                onChanged: (Location? value) {
                  // newLocationList(value!.pincodeId);
                  // This is called when the user selects an item.
                  setState(() {
                    showSelectedState = value;
                  });
                  print(showSelectedState!.place);
                },
                items: locationList
                    .map<DropdownMenuItem<Location>>((Location value) {
                  return DropdownMenuItem<Location>(
                    value: value,
                    child: Text(value.place ?? ''),
                  );
                }).toList(),
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

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
  LocationSelectScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _LocationSelectScreenState createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  List<Location> locationList = [];
  Location? selectedValue;
  String? hello;
  TextEditingController v = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location('');
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

  void location(String value) {
    NetworkManager.shared
        .custLocation(value)
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownSearch<Location>(
                dropdownSearchDecoration:
                    InputDecoration(border: UnderlineInputBorder()),
                mode: Mode.DIALOG,
                showSelectedItem: false,
                items: locationList,
                itemAsString: (Location u) => u.place!,
                hint: "select",
                onChanged: (value) {
                  v.text = value!.pincodeId.toString();
                  location(value.place!);
                  print(value.pincodeId);
                },
                showSearchBox: true,
                filterFn: (instance, filter) {
                  if (instance.place!.contains(filter)) {
                    print(filter);
                    return true;
                  } else {
                    return false;
                  }
                },
                popupItemBuilder: (context, Location item, bool isSelected) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: !isSelected
                        ? null
                        : BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.place!),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

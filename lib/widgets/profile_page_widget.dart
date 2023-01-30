import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/screens/edit_profile_screen.dart';
import 'package:sizer/sizer.dart';

class ProfilePageWidget extends StatefulWidget {
  String tittle;
  String subTitle;
  Icon icon;

  ProfilePageWidget(this.tittle, this.subTitle, this.icon);

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.tittle,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Intro",
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.subTitle,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Intro",
                    fontWeight: FontWeight.bold),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Container(
                height: 60,
                width: 60,
                child: widget.icon,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}

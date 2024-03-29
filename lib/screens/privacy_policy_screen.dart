import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/base/base_stateful_state.dart';
import 'package:lenzcamera/connection/network_manager.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/screens/home_screen.dart';
import 'package:lenzcamera/utils/constants.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends BaseStatefulState<PrivacyPolicyScreen> {
  List<CompanyPolicy> companyPolicyList = [];
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(milliseconds: 500), () {
    getPrivacyPolicy();
    // });
  }

  void getPrivacyPolicy() {
    // showLoader();

    NetworkManager.shared
        .getCompanyPolicy()
        .then((BaseResponse<List<CompanyPolicy>> response) {
      // hideLoader();
      setState(() {
        // isLoading = false;
        companyPolicyList.clear();
        companyPolicyList.addAll(response.data!);
      });
    }).catchError((e) {
      // hideLoader();
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Privacy Policy'),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.favorite_border),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.shopping_cart),
        //   ),
        // ],
        backgroundColor: kappBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  companyPolicyList.first.name ?? '',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 25),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(companyPolicyList.first.value ?? ''),
          ),
          // Text(companyPolicyList.first.name??''),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}

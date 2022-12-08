import 'package:flutter/material.dart';

enum LoadState { loading, success, failure }

class CircularLoadingWidget extends StatefulWidget {
  const CircularLoadingWidget({Key? key}) : super(key: key);

  @override
  _CircularLoadingWidgetState createState() => _CircularLoadingWidgetState();
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}
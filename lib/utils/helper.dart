import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lenzcamera/widgets/circular_loading_widget.dart';

class Helper {
  static bool validateEmail(String value) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }

  static bool validatePhone(String value) {
    return RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(value);
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: Colors.white.withOpacity(0.40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularLoadingWidget(),
            ],
          ),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry? loader) {
    Timer(const Duration(milliseconds: 500), () {
      try {
        loader!.remove();
      } catch (e) {}
    });
  }

  static getRandomString() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}

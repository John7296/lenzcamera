import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io' show Platform;

import 'package:lenzcamera/utils/helper.dart';


abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  OverlayEntry? loader;

  BaseStatefulState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void initState() {
    super.initState();
    bool isIOS = Platform.isIOS;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness: isIOS
            ? Brightness.light
            : Brightness.dark // Dark == white status bar -- for IOS.
        ));

  }

  bool isAuthenticationRequired();

  void enableFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  void showLoader() {
    loader ??= Helper.overlayLoader(context);
    Overlay.of(context)!.insert(loader!);
  }

  void hideLoader() {
    Helper.hideLoader(loader!);
  }

  // void replaceScreen(String route) {
  //   // Navigator.pushReplacementNamed(context, route);

  //   if (isAuthenticationRequired()) {
  //     SessionManager.isLoggedIn().then((value) {
  //       if (!value) {
  //         Navigator.pushNamed(context, Routes.login);
  //       } else {
  //         Navigator.pushReplacementNamed(context, route);
  //       }
  //     });
  //   } else {
  //     Navigator.pushReplacementNamed(context, route);
  //   }
  // }

  // void gotToScreen(String route) {
  //   // Navigator.pushNamed(context, route);
  //   if (isAuthenticationRequired()) {
  //     SessionManager.isLoggedIn().then((value) {
  //       if (!value) {
  //         Navigator.pushNamed(context, Routes.login);
  //       } else {
  //         Navigator.pushNamed(context, route);
  //       }
  //     });
  //   } else {
  //     Navigator.pushNamed(context, route);
  //   }
  // }


    void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } 
    else {
      SystemNavigator.pop();
    }
  }

  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void showFlashMsg(String msg, {Color color = const Color(0xFF272532)}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          boxShadows: kElevationToShadow[2],
          backgroundColor: color,
          reverseAnimationCurve: Curves.easeInCirc,
          forwardAnimationCurve: Curves.easeInOutBack,
          margin: const EdgeInsets.all(8.0),
          borderRadius: BorderRadius.circular(6.0),
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              msg,
              style: const TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Size getScreenSize() {
    return MediaQuery.of(context).size;
  }
}

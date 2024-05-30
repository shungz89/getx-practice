import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../main.dart';

class CommonWidget {
  static FToast fToast = FToast();


  ///TODO: This is the example of using SnackBar using toast / flushbar should work like this too
  static void toast(String text) async {
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(Get.context!);
    _showToast(text);
  }

  static _showToast(String text) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );

    //Toast Position Top
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
  }

  ///TODO: This is the example of using SnackBar using scaffoldMessengerKey
  static void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('This is a message.'),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: Get.size.height - 150,
      ),      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () { },
      ),
    );

    ScaffoldMessenger.of(App.scaffoldMessengerKey.currentState!.context).showSnackBar(snackBar);
  }
}

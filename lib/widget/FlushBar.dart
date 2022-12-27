import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FlushBarWidget {
  void showFloatingFlushBar(BuildContext context, String title, String? message, Icon icons, bool isSuccess) {
    Flushbar(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      backgroundGradient: LinearGradient(
        colors: isSuccess ? [Colors.green.shade800, Colors.greenAccent.shade700] : [Colors.red.shade800, Colors.redAccent.shade700] ,
        stops: [0.6, 1],
      ),
      boxShadows: [
        const BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      duration: const Duration(seconds: 1),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
      icon: icons,
    ).show(context);
  }

  void showInfoFlushBarHelper(BuildContext context, String title, String message) {
    FlushbarHelper.createInformation(
      title: title,
      message: message,
    ).show(context);
  }

  void showLoading(BuildContext context, String message) {
    Flushbar(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade800, Colors.blueAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        const BoxShadow(
          color: Colors.black45,
          offset: const Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: message,
      showProgressIndicator: true,
      duration: const Duration(seconds: 5),
    ).show(context);
  }

  Flushbar showLoadingFlushbar(BuildContext context, String message) {
    return Flushbar(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade800, Colors.blueAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        const BoxShadow(
          color: Colors.black45,
          offset: const Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: message,
      showProgressIndicator: true,
    );
  }

  static Flushbar showSuccess(String message) {
    return Flushbar(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        titleText: const Text("Succes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        messageText: Text(message, style: const TextStyle(color: Colors.white, fontSize: 16)),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        blockBackgroundInteraction: true,
        flushbarPosition: FlushbarPosition.TOP
    );
  }

  static Flushbar showFailure(String message, {String? title}) {
    return Flushbar(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        titleText: Text(title == null ? "Error" : title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        messageText: Text(message, style: const TextStyle(color: Colors.white, fontSize: 16)),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        blockBackgroundInteraction: true,
        flushbarPosition: FlushbarPosition.TOP
    );
  }

  static Flushbar showFailureNoTitle(String message) {
    return Flushbar(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        messageText: Text(message, style: const TextStyle(color: Colors.white, fontSize: 16)),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        blockBackgroundInteraction: true,
        flushbarPosition: FlushbarPosition.TOP
    );
  }
}
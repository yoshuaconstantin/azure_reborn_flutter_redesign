import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Navigators {
  static GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  static void push(BuildContext buildContext, Widget widget) {
    Navigator.of(buildContext).push(
        MaterialPageRoute(builder: (context) {
          return widget;
        })
    );
  }

  static void pushAndRemoveAll(BuildContext buildContext, Widget widget) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(buildContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return widget;
          }), (route) => false
      );
    });
  }

  static void pop(BuildContext buildContext) {
    Navigator.of(buildContext).pop(buildContext);
  }

  static void popAll(BuildContext buildContext) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(buildContext).popUntil((route) => route.isFirst);
    });
  }
}
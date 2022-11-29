import 'package:flutter/material.dart';

class CustomDialog{

  Future<void> dialogCustom(BuildContext context, double x, double y, Widget widget)async {
    showDialog(context: context, builder: (context) =>
        Align(
          alignment: Alignment(x,y),
          child: widget,
        )
    );
  }
}
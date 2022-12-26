import 'dart:io';

import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/material.dart';

import '../additional/dimension.dart';
import '../model/information_zram_model/zram_setting_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Dialogs {
  static Future<void> message({
    required BuildContext buildContext,
    required String title,
    String? message,
    String? dismiss,
    bool showButton = true,
    bool cancelable = true
  }) {
    Widget? content;

    if (message != null) {
      content = SingleChildScrollView(
        child: Text(message),
      );
    }

    List<Widget> actions = [];

    if (showButton) {
      actions.add(
          TextButton(
              child: Text(dismiss ?? "Mengerti"),
              onPressed: () => Navigator.of(buildContext).pop()
          )
      );
    }

    return showDialog(
        context: buildContext,
        builder: (BuildContext buildContext) {
          return AlertDialog(
              title: Text(title),
              content: content,
              actions: actions
          );
        }
    );
  }

  static Future<void> confirmation({
    required BuildContext buildContext,
    required String title,
    String? message,
    String? negative,
    String? positive,
    bool cancelable = true,
    VoidCallback? negativeCallback,
    VoidCallback? positiveCallback
  }) {
    Widget? content;

    if (message != null) {
      content = SingleChildScrollView(
        child: Text(message),
      );
    }

    return showDialog(
        context: buildContext,
        builder: (BuildContext buildContext) {
          return AlertDialog(
              title: Text(title),
              content: content,
              actions: [
                TextButton(
                    child: Text(negative ?? "Tidak"),
                    onPressed: () {
                      Navigator.of(buildContext).pop();

                      if (negativeCallback != null) {
                        negativeCallback.call();
                      }
                    }
                ),
                TextButton(
                    child: Text(positive ?? "Iya"),
                    onPressed: () {
                      Navigator.of(buildContext).pop();

                      if (positiveCallback != null) {
                        positiveCallback.call();
                      }
                    }
                )
              ]
          );
        }
    );
  }



  static Future<void> zramSetting({
    required BuildContext buildContext,
    required String title,
    required void Function(ZramSettingModel zramModel) callback
  }) {
    return showDialog(
        context: buildContext,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.radius30)
              ),
              title: Text(title),
              content: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "ZRAM SETTING", color: Color(0xFF79F7FF), fontFamily: 'openSansExtraBold', fontSize: 25, fontWeight: FontWeight.w700),
                      SizedBox(height: Dimension.height10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   height: Dimension.screenHeight * 0.05,
                              //   child: SfSlider(
                              //       value: value,
                              //       onChanged: onChanged),
                              // )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              actionsPadding: EdgeInsets.only(
                  right: Dimension.width20,
                  bottom: Dimension.height20
              )
          );
        }
    );
  }
}
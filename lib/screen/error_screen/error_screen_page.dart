import 'dart:io';

import 'package:azure_reborn/additional/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../additional/dimension.dart';
import '../../helper/dialogs.dart';
import '../../widget/text_with_font.dart';

class ErrorScreen extends StatefulWidget {
  String message;
  ErrorScreen({Key? key, required this.message}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/image/img_data/error.png", fit: BoxFit.fill,),
          Positioned(
              left: Dimension.screenWidth * 0.136,
              bottom: Dimension.screenHeight * 0.155,
              child: textWithFont(text: widget.message,
                color: Colors.redAccent,
                fontFamily: "ralewayLight",
                fontSize: 30,
                fontWeight: FontWeight.w800,)),
          Positioned(
              right: Dimension.screenWidth * 0.05,
              bottom: Dimension.screenHeight * 0.03,
              child:
              ElevatedButton(
                onPressed:
                    () {
                  exit(0);
                },
                child: Container(
                  width: Dimension.screenWidth * 0.4,
                  height: Dimension.screenHeight * 0.07,
                  child:
                  Center(child:
                  textWithFont(text: "EXIT APP",
                    color: AppColor.seaBlue,
                    fontFamily: "ralewayLight",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,)),
                ),
                style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                    backgroundColor: AppColor.neoLightShadow),
              )
          )
        ],
      ),

    );
  }
}

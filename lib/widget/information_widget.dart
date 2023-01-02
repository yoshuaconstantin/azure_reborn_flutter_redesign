import 'package:azure_reborn/additional/dimension.dart';
import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../screen/cpu_information_screen/cpu_information_page.dart';
import 'custom_neumorph.dart';

class InformationWidget extends StatefulWidget {
  double cpuTemp;
  double GpuTemp;
  double BattTemp;

  InformationWidget({Key? key, required this.cpuTemp, required this.BattTemp, required this.GpuTemp}) : super(key: key);

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimension.screenWidth,
      height: Dimension.screenHeight * 0.23,
      margin: EdgeInsets.only(
          top: Dimension.screenHeight * 0.01,
          bottom: Dimension.screenHeight * 0.05,
          right: Dimension.screenWidth * 0.05,
          left: Dimension.screenWidth * 0.05
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: Dimension.screenWidth * 0.43,
                height: Dimension.screenHeight * 0.23,
                decoration: BoxDecoration(
                  color: const Color(0xFF3D087B),
                    borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () async {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CpuInformationPage(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimension.size4, horizontal: Dimension.size12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox( height: Dimension.size10,),
                        textWithFont(text: "STATISTICS",
                          color: const Color(0xFFFFE459),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox( height: Dimension.size10,),
                        textWithFont(text: "CPU CLOCKSPEED",
                          color: const Color(0xFFFFE459),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox( height: Dimension.size4,),
                        textWithFont(text: "GPU CLOCKSPEED",
                          color: const Color(0xFFFFE459),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox( height: Dimension.CustomSize(20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/icons/icon_statistics.png',
                              height: Dimension.CustomSize(55),
                              width: Dimension.CustomSize(55),
                            ),
                            Icon(Icons.circle, size: 20, color: const Color(0xFFF43B86),),
                            Icon(Icons.arrow_forward_ios, size: Dimension.CustomSize(55), color: const Color(0xFF11052C),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: Dimension.CustomSize(7),
                bottom: Dimension.CustomSize(5),
                child: Lottie.asset('assets/anim/lottie_json/tap_button.json',
                    animate: true,
                    width: Dimension.CustomSize(40),
                    height: Dimension.CustomSize(40)
                ),
              )
            ],
          ),
          Container(
            width: Dimension.screenWidth * 0.43,
            height: Dimension.screenHeight * 0.23,
            decoration: BoxDecoration(
              color: const Color(0xFF2D033B),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(30), horizontal: Dimension.CustomSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWithFont(
                              text: widget.cpuTemp.toStringAsFixed(0)+"℃",
                              color: const Color(0xFFE5B8F4),
                              fontSize: 27,
                              fontWeight: FontWeight.w800 ,
                          ),
                          SizedBox(
                            height: Dimension.CustomSize(3),
                          ),
                          textWithFont(
                              text: "CPU TEMP",
                              color: const Color(0xFFC147E9),
                              fontSize: 12,
                              fontWeight: FontWeight.w300 ,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWithFont(
                            text: widget.GpuTemp.toStringAsFixed(0)+"℃",
                            color: const Color(0xFFE5B8F4),
                            fontSize: 27,
                            fontWeight: FontWeight.w800 ,
                          ),
                          SizedBox(
                            height: Dimension.CustomSize(3),
                          ),
                          textWithFont(
                            text: "GPU TEMP",
                            color: const Color(0xFFC147E9),
                            fontSize: 12,
                            fontWeight: FontWeight.w300 ,
                          ),
                        ],
                      )
                    ],
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWithFont(
                            text: widget.BattTemp.toStringAsFixed(0)+"℃",
                            color: const Color(0xFFE5B8F4),
                            fontSize: 27,
                            fontWeight: FontWeight.w800 ,
                          ),
                          SizedBox(
                            height: Dimension.CustomSize(3),
                          ),
                          textWithFont(
                            text: "BAT TEMP",
                            color: const Color(0xFFC147E9),
                            fontSize: 12,
                            fontWeight: FontWeight.w300 ,
                          ),
                        ],
                      ),
                      Icon(Icons.shield, color: Colors.white, size: 60,)
                    ],
                  )
                  ],
                  )
              ),
            ),

        ],
      ),
    );
  }
}

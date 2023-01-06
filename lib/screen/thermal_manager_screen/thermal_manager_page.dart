import 'package:azure_reborn/additional/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../widget/text_with_font.dart';

class ThermalManager extends StatefulWidget {
  const ThermalManager({Key? key}) : super(key: key);

  @override
  State<ThermalManager> createState() => _ThermalManagerState();
}

class _ThermalManagerState extends State<ThermalManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimension.CustomSize(15)),
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        color: Color(0xFF162D0D),
        child: Column(
          children: [
            Container(
              height: Dimension.screenHeight * 0.2,
              width: Dimension.screenWidth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 35, color: Color(0xFF162D0D),),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xFFA1AB9E),
                        fixedSize: Size(Dimension.CustomSize(75), Dimension.CustomSize(75))
                      ),
                  ),
                  Container(
                    height: Dimension.screenHeight * 0.2,
                    width: Dimension.screenWidth * 0.3,
                    padding: EdgeInsets.all(Dimension.CustomSize(7)),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Color(0xFFA1AB9E)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWithFont(text: "FEATURE RANK",
                          color: Color(0xFF162D0D),
                          fontFamily: "openSansExtraBold",
                          fontSize: 20,
                          fontWeight: FontWeight.w800,),
                        textWithFont(text: "EXPERT",
                          color: Color(0xFF162D0D),
                          fontFamily: "ralewayLight",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,),
                        RoundedProgressBar(
                          percent: 44,
                          height: Dimension.screenHeight * 0.02,
                          style: RoundedProgressBarStyle(
                            colorBorder: Colors.transparent,
                            widthShadow: 0,
                            borderWidth: 0,
                            backgroundProgress: Color(0xFF6E7C78),
                            colorProgress: Color(0xFF2C4C3B),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

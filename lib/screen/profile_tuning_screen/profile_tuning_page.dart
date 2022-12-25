import 'package:azure_reborn/additional/constant.dart';
import 'package:azure_reborn/screen/profile_tuning_screen/bloc/profile_tuning_bloc.dart';
import 'package:azure_reborn/widget/noOverScroll.dart';
import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../additional/dimension.dart';

class ProfileTuningPage extends StatefulWidget {
  const ProfileTuningPage({Key? key}) : super(key: key);

  @override
  State<ProfileTuningPage> createState() => _ProfileTuningPageState();
}

class _ProfileTuningPageState extends State<ProfileTuningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileTuningBloc, ProfileTuningState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: ScrollConfiguration(
          behavior: NoOverscrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              height: Dimension.screenHeight,
              padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(13)),
              color: Color(0xFF144272),
              child: Column(
                children: [
                  SizedBox(height: Dimension.CustomSize(24),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          HapticFeedback.mediumImpact();
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: Dimension.screenWidth * 0.12,
                            height: Dimension.screenHeight * 0.07,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFA555EC)),
                            child: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFFFD0), size: 20,)),
                      ),
                      textWithFont(text: "AZURE TUNING", color: Colors.white, fontFamily: "openSansExtraBold", fontSize: 25, fontWeight: FontWeight.w900,),
                      Image.asset("assets/image/icons/azurenewlogo_round.png", width: Dimension.CustomSize(50), height: Dimension.CustomSize(50),)
                    ],
                  ),
                  SizedBox(height: Dimension.CustomSize(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                          child: Stack(
                            children: [
                              Container(
                                height: Dimension.screenHeight * 0.2,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF222222)),
                                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(13)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWithFont(text: "ACTIVED PROFILE", color: Colors.white, fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w700,),
                                    SizedBox(height: Dimension.CustomSize(5),),
                                    textWithFont(text: "FAST AF", color: Colors.white, fontFamily: "openSansExtraBold", fontSize: 45, fontWeight: FontWeight.w700,),
                                    SizedBox(height: Dimension.CustomSize(10),),
                                    textWithFont(text: "FEATURE RANK", color: const Color(0xFF22A39F), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w500,),
                                    Container(
                                      margin: EdgeInsets.only(top: Dimension.CustomSize(5), bottom: Dimension.CustomSize(3)),
                                      child: RoundedProgressBar(
                                        percent: 35,
                                        height: Dimension.screenHeight * 0.02,
                                        style: RoundedProgressBarStyle(
                                          colorBorder: Colors.transparent,
                                          widthShadow: 0,
                                          borderWidth: 0,
                                          backgroundProgress: Color(0xFF22A39F),
                                          colorProgress: Color(0xFF902727),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),

                                    textWithFont(text: "NUBIE", color: Colors.white, fontFamily: "ralewayLight", fontSize: 17, fontWeight: FontWeight.w800,),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: Dimension.size8,
                                top: Dimension.size8,
                                child: Icon(Icons.circle, size: 20, color: Colors.green,),
                              )
                            ],
                          )),
                      SizedBox(width: Dimension.CustomSize(10),),
                      Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Container(
                                height: Dimension.screenHeight * 0.2,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFF2DEBA)),
                                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(7), horizontal: Dimension.CustomSize(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child:textWithFont(text: "PROFILES", color: const Color(0xFF0E5E6F), fontFamily: "openSansExtraBold", fontSize: 30, fontWeight: FontWeight.w900,),
                                    ),
                                    SizedBox(height: Dimension.CustomSize(20),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child:textWithFont(text: "VERSION", color: const Color(0xFF0E5E6F), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                        Expanded(
                                          child:textWithFont(text: ProfilesConstant().version, color: const Color(0xFF3A8891), fontFamily: "openSansExtraBold", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Dimension.CustomSize(5),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child:textWithFont(text: "REVISION", color: const Color(0xFF0E5E6F), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                        Expanded(
                                          child:textWithFont(text: ProfilesConstant().revision, color: const Color(0xFF3A8891), fontFamily: "openSansExtraBold", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Dimension.CustomSize(5),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child:textWithFont(text: "STATUS", color: const Color(0xFF0E5E6F), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                        Expanded(
                                          child:textWithFont(text: ProfilesConstant().status, color: const Color(0xFF3A8891), fontFamily: "openSansExtraBold", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Dimension.CustomSize(5),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child:textWithFont(text: "CREATOR", color: const Color(0xFF0E5E6F), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                        Expanded(
                                          child:textWithFont(text: ProfilesConstant().creator, color: const Color(0xFF3A8891), fontFamily: "openSansExtraBold", fontSize: 15, fontWeight: FontWeight.w900,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: Dimension.CustomSize(25),),
                  chill()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Widget Chill
  Widget chill(){
    return Container(
      height: Dimension.screenHeight * 0.22,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(10)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF9CB2FF)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 40,),
                        SizedBox(width: Dimension.size4,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWithFont(text: "CHILL", color: Color(0xFF181D31), fontFamily: "openSansExtraBold", fontSize: 25, fontWeight: FontWeight.w600,),
                            textWithFont(text: ProfilesConstant().chillTopText, color: Color(0xFF181D31), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w500,),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(30),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWithFont(text: "Battery ", color: Color(0xFF004844), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),
                        textWithFont(text: "Saver", color: Color(0xFF00726B), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),

                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(20),),
                    textWithFont(text: "Total profile used", color: Color(0xFF00726B), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w600,),
                    textWithFont(text: "100 Times", color: Color(0xFF181D31), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w700,),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWithFont(text: "PERFORMANCE METER", color: Color(0xFF065C8C), fontFamily: "ralewayLight", fontSize: 16, fontWeight: FontWeight.w900,),
                  SizedBox(height: Dimension.CustomSize(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //power
                      RotatedBox(
                          quarterTurns: -1,
                          child: textWithFont(text: "POWER", color: Color(0xFF065C8C), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          width: Dimension.screenWidth * 0.28,
                          child: RoundedProgressBar(
                            percent: 30,
                            height: Dimension.CustomSize(25),
                            style: RoundedProgressBarStyle(
                              colorBorder: Colors.transparent,
                              widthShadow: 0,
                              borderWidth: 0,
                              backgroundProgress: Color(0xFFADE0DD),
                              colorProgress: Color(0xFF181D31),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimension.width5,),
                      //Efficiency
                      RotatedBox(
                          quarterTurns: -1,
                          child: textWithFont(text: "EFFICIENCY", color: Color(0xFF065C8C), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          width: Dimension.screenWidth * 0.28,
                          child: RoundedProgressBar(
                            percent: 80,
                            height: Dimension.CustomSize(25),
                            style: RoundedProgressBarStyle(
                              colorBorder: Colors.transparent,
                              widthShadow: 0,
                              borderWidth: 0,
                              backgroundProgress: Color(0xFFADE0DD),
                              colorProgress: Color(0xFF181D31),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimension.width5,),
                      //Experience
                      RotatedBox(
                          quarterTurns: -1,
                          child: textWithFont(text: "EXPERIENCE", color: Color(0xFF065C8C), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          width: Dimension.screenWidth * 0.28,
                          child: RoundedProgressBar(
                            percent: 45,
                            height: Dimension.CustomSize(25),
                            style: RoundedProgressBarStyle(
                              colorBorder: Colors.transparent,
                              widthShadow: 0,
                              borderWidth: 0,
                              backgroundProgress: Color(0xFFADE0DD),
                              colorProgress: Color(0xFF181D31),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimension.width5,),
                      //Game Experience
                      RotatedBox(
                          quarterTurns: -1,
                          child: textWithFont(text: "GAME EXP.", color: Color(0xFF065C8C), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          width: Dimension.screenWidth * 0.28,
                          child: RoundedProgressBar(
                            percent: 30,
                            height: Dimension.CustomSize(25),
                            style: RoundedProgressBarStyle(
                              colorBorder: Colors.transparent,
                              widthShadow: 0,
                              borderWidth: 0,
                              backgroundProgress: Color(0xFFADE0DD),
                              colorProgress: Color(0xFF181D31),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),



                    ],
                  )
                ],
              ))
            ],
          )
        ],
      ),

    );

  }


}

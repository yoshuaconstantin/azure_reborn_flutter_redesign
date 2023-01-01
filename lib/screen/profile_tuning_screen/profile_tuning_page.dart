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
import '../../helper/navigators.dart';
import '../../widget/custom_app_bar.dart';

class ProfileTuningPage extends StatefulWidget {
  const ProfileTuningPage({Key? key}) : super(key: key);

  @override
  State<ProfileTuningPage> createState() => _ProfileTuningPageState();
}

class _ProfileTuningPageState extends State<ProfileTuningPage> {

  double chillPwr = 0,chillEff = 0,chillExp = 0, chillGameExp = 0;
  double smartPwr = 0,smartEff = 0,smartExp = 0, smartGameExp = 0;
  double fastPwr = 0,fastEff = 0,fastExp = 0, fastGameExp = 0;
  double FeatureProgress = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  context.read<ProfileTuningBloc>().add(fillProgressProfile());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:"AZURE TUNING",
        titleColor: Colors.white,
        titlefontSize: 25,
        titlefontFamily: "openSansExtraBold",
        titlefontWeight: FontWeight.w900,
        iconColor: Colors.white,
        arrowBackTapped: () {
          HapticFeedback.mediumImpact();
          Navigator.pop(context);
          },
        backgroundColor: Color(0xFF144272),

      ),
      body: BlocListener<ProfileTuningBloc, ProfileTuningState>(
        listener: (context, state) async {
          // TODO: implement listener
          if(state is catchError){
            Navigators.errorScreen(context, "Page Error!");
          }else if(state is fillProgressSucces){
            Future.delayed(Duration(milliseconds: 1500));
            setState(() {
              chillPwr = 20; chillEff = 80; chillExp = 40; chillGameExp = 35;
              smartPwr = 60; smartEff = 35; smartExp = 70; smartGameExp = 65;
              fastPwr = 99; fastEff = 25; fastExp = 100; ; fastGameExp = 100;
              FeatureProgress = 35;
            });
          }
        },
        child: ScrollConfiguration(
          behavior: NoOverscrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(13)),
              color: Color(0xFF144272),
              child: Column(
                children: [
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
                                        percent: FeatureProgress,
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
                  chill(),
                  SizedBox(height: Dimension.CustomSize(15),),
                  smart(),
                  SizedBox(height: Dimension.CustomSize(15),),
                  fast()
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
                            percent: chillPwr,
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
                            percent: chillEff,
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
                            percent: chillExp,
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
                            percent: chillGameExp,
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

  //Widget Smart
  Widget smart(){
    return Container(
      height: Dimension.screenHeight * 0.22,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(10)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFE5B8F4)),
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
                            textWithFont(text: "SMART", color: Color(0xFF810CA8), fontFamily: "openSansExtraBold", fontSize: 25, fontWeight: FontWeight.w600,),
                            textWithFont(text: ProfilesConstant().chillTopText, color: Color(0xFF181D31), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w500,),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(30),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWithFont(text: "Balanced ", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),
                        textWithFont(text: "Perf", color: Color(0xFFBF00FF), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),

                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(20),),
                    textWithFont(text: "Total profile used", color: Color(0xFF2D033B), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w600,),
                    textWithFont(text: "100 Times", color: Color(0xFF181D31), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w700,),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "PERFORMANCE METER", color: Color(0xFF2D033B), fontFamily: "ralewayLight", fontSize: 16, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.CustomSize(20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //power
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "POWER", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: smartPwr,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFE0ADAD),
                                  colorProgress: Color(0xFF2D033B),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Efficiency
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "EFFICIENCY", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: smartEff,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFE0ADAD),
                                  colorProgress: Color(0xFF2D033B),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Experience
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "EXPERIENCE", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: smartExp,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFE0ADAD),
                                  colorProgress: Color(0xFF2D033B),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Game Experience
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "GAME EXP.", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: smartGameExp,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFE0ADAD),
                                  colorProgress: Color(0xFF2D033B),
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

  //Widget Fast
  Widget fast(){
    return Container(
      height: Dimension.screenHeight * 0.22,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(10)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFFCFFE7)),
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
                            textWithFont(text: "SMART", color: Color(0xFF2B3467), fontFamily: "openSansExtraBold", fontSize: 25, fontWeight: FontWeight.w600,),
                            textWithFont(text: ProfilesConstant().chillTopText, color: Color(0xFF2B3467), fontFamily: "ralewayLight", fontSize: 15, fontWeight: FontWeight.w500,),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(30),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWithFont(text: "Faster ", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),
                        textWithFont(text: "YES!", color: Color(0xFFBF00FF), fontFamily: "openSansExtraBold", fontSize: 20, fontWeight: FontWeight.w700,),

                      ],
                    ),
                    SizedBox(height: Dimension.CustomSize(20),),
                    textWithFont(text: "Total profile used", color: Color(0xFF2B3467), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w600,),
                    textWithFont(text: "100 Times", color: Color(0xFF181D31), fontFamily: "ralewayLight", fontSize: 14, fontWeight: FontWeight.w700,),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "PERFORMANCE METER", color: Color(0xFF2B3467), fontFamily: "ralewayLight", fontSize: 16, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.CustomSize(20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //power
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "POWER", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: fastPwr,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFADCEE0),
                                  colorProgress: Color(0xFFEB455F),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Efficiency
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "EFFICIENCY", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: fastEff,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFADCEE0),
                                  colorProgress: Color(0xFFEB455F),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Experience
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "EXPERIENCE", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: fastExp,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFADCEE0),
                                  colorProgress: Color(0xFFEB455F),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimension.width5,),
                          //Game Experience
                          RotatedBox(
                              quarterTurns: -1,
                              child: textWithFont(text: "GAME EXP.", color: Color(0xFF2D033B), fontFamily: "openSansExtraBold", fontSize: 17, fontWeight: FontWeight.w500,)),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              width: Dimension.screenWidth * 0.28,
                              child: RoundedProgressBar(
                                percent: fastGameExp,
                                height: Dimension.CustomSize(25),
                                style: RoundedProgressBarStyle(
                                  colorBorder: Colors.transparent,
                                  widthShadow: 0,
                                  borderWidth: 0,
                                  backgroundProgress: Color(0xFFADCEE0),
                                  colorProgress: Color(0xFFEB455F),
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

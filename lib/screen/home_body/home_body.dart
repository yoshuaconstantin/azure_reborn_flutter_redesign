import 'dart:math';

import 'package:azure_reborn/additional/app_color.dart';
import 'package:azure_reborn/additional/dimension.dart';
import 'package:azure_reborn/widget/custom_dialog.dart';
import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../additional/constant.dart';
import '../../additional/preferences.dart';
import '../../model/home_body_model/chart_home_model.dart';
import '../../model/home_body_model/list_home_card_model.dart';
import '../../widget/custom_neumorph.dart';
import '../../widget/home_chart.dart';
import '../../widget/noOverScroll.dart';
import '../../widget/vertical_text.dart';
import 'home_body_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);


  @override
  State<HomeBody> createState() => _HomeBodyState();
}



class _HomeBodyState extends State<HomeBody> {
  double performance = 0;
  double efeciency = 0;
  double experience = 0;
  Random objectname = Random();


  List<ChartDataModel> modelChart = [];
  List<ListHomeCardModel> modelHomeCard =[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();



    modelHomeCard.add(ListHomeCardModel(
        idFitur: 1,
        namaFitur: "Tuning",
        ketFitur: "Let you decide how you treat the performance",
        rankingFitur: ranking(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureModeRank)
        ?? 0),
        rankingProgress: rankProgress(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureModeRank) ?? 0),
        gambarIcon: "assets/anim/lottie_json/mode.json"));

    modelHomeCard.add(ListHomeCardModel(
        idFitur: 2,
        namaFitur: "Thermal",
        ketFitur: "Choose your phone thermal system behaviour",
        rankingFitur: ranking(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureThermalRank)
            ?? 880),
        rankingProgress: rankProgress(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureThermalRank) ?? 880),
        gambarIcon: "assets/anim/lottie_json/thermal.json"));

    modelHomeCard.add(ListHomeCardModel(
        idFitur: 3,
        namaFitur: "Doze",
        ketFitur: "Save more battery with buch of doze settings",
        rankingFitur: ranking(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureDozeRank)
            ?? 0),
        rankingProgress: rankProgress(Preferences.getInstance().getInt(SharedPreferenceKey.FeatureDozeRank) ?? 0),
        gambarIcon: "assets/anim/lottie_json/doze.json"));

    modelChart.add(ChartDataModel("Core1",randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber()));
    modelChart.add(ChartDataModel("Core2",randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber()));
    modelChart.add(ChartDataModel("Core3",randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber()));
    modelChart.add(ChartDataModel("Core4",randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber()));
    modelChart.add(ChartDataModel("Core5",randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber(),randomNumber()));



}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBodyBloc, HomeBodyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Container(
          height: Dimension.screenHeight,
          color: AppColor.neoShadow,
          child: ScrollConfiguration(
            behavior: NoOverscrollBehavior(),
            child: SingleChildScrollView(

              child: Column(
                children: [
                  appBar(),
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimension.CustomSize(35),
                        right: Dimension.screenWidth * 0.05,
                        left: Dimension.screenWidth * 0.05),
                    alignment: Alignment.centerLeft,
                    child:textWithFont(text: "DASHBOARDS", color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900,),

                  ),
                  cardDashboardMostUsedMode(),
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimension.CustomSize(35),
                        right: Dimension.screenWidth * 0.05,
                        left: Dimension.screenWidth * 0.05),
                    alignment: Alignment.centerLeft,
                    child:textWithFont(text: "FEATURES", color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900,),

                  ),
                  listCard(),
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimension.CustomSize(35),
                        right: Dimension.screenWidth * 0.05,
                        left: Dimension.screenWidth * 0.05),
                    alignment: Alignment.centerLeft,
                    child:textWithFont(text: "INFORMATION", color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900,),

                  ),
                  HomePresenceChart(chartData: modelChart,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar(){
    return Container(
      width: Dimension.screenWidth,
      height: Dimension.screenHeight * 0.07,
      margin: EdgeInsets.only(
          top: Dimension.screenHeight * 0.04,
          right: Dimension.screenWidth * 0.05,
          left: Dimension.screenWidth * 0.05
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: Dimension.screenWidth * 0.13,
              height: Dimension.screenHeight * 0.07,
              margin: EdgeInsets.only(right: Dimension.width10),
              child: Container(
                child: Image.asset(
                  "assets/image/icons/azurenewlogo_round.png",
                ),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWithFont(text: "Hi User",fontWeight: FontWeight.w800, color: Colors.white, fontSize: 19,),
                  SizedBox(height: Dimension.height5,),
                  textWithFont(text: "Welcome to Azure", color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400,),
                ],
              ),
            ),
          ),
          Container(
            height: Dimension.screenHeight * 0.07,
            width: Dimension.screenWidth * 0.15,
            child: NeumorphicButton(
              onPressed: (){

              },
              style: NeumorphicStyle(
                  depth: -1,
                  intensity: 1,
                  surfaceIntensity: 0.3,
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  lightSource: LightSource.topLeft,
                  shadowLightColor: const Color(0xFF580707),
                  shadowDarkColor: const Color(0XFF780909),
                  color: Color(0XFF680808)),
              child: Icon(Icons.settings, size: 25,color: Colors.white,),
            ),
          )
        ],
      ),

    );
  }

  Widget cardDashboardMostUsedMode(){
    return Container(
      margin: EdgeInsets.only(
          top: Dimension.screenHeight * 0.01,
          right: Dimension.screenWidth * 0.05,
          left: Dimension.screenWidth * 0.05
      ),
      width: Dimension.screenWidth,
      height: Dimension.screenHeight * 0.17,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -4,
            intensity: 2,
            surfaceIntensity: 0.5,
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            lightSource: LightSource.topLeft,
            shadowLightColor: const Color(0xFF4ac3c1),
            shadowDarkColor: const Color(0XFF64ffff),
            color: AppColor.blueazure,
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimension.height20, left: Dimension.width30, right: Dimension.width20, bottom: Dimension.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Dimension.screenWidth * 0.6,
                          child: textWithFont(
                            text: Constant().currentMode,
                            color: AppColor.neoBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'poesten',
                          ),
                        ),
                        Container(
                          width: Dimension.screenWidth * 0.25,
                          height: Dimension.screenHeight * 0.05,
                          child: NeumorphicButton(
                            onPressed: (){
                            CustomDialog().dialogCustom(context,
                                -0.5,
                                -0.415,
                                Container(
                                  width: Dimension.screenWidth * 0.5,
                                  height: Dimension.screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.blueazure
                                  ),
                                  child: Neumorphic(
                                    style: NeumorphicStyle(
                                      depth: -1,
                                      intensity: 2,
                                      surfaceIntensity: 0.5,
                                      shape: NeumorphicShape.flat,
                                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                                      lightSource: LightSource.topLeft,
                                      shadowLightColor: const Color(0xFF515283),
                                      shadowDarkColor: const Color(0XFF3c3c61),
                                      color: Color(0xFF464772),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                      ],
                                    ),
                                  ),
                                ));
                            },
                            style: NeumorphicStyle(
                              depth: -2,
                              intensity: 0.7,
                              surfaceIntensity: 0.5,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                              lightSource: LightSource.topLeft,
                              shadowLightColor: const Color(0xFF515283),
                              shadowDarkColor: const Color(0XFF3c3c61),
                              color: Color(0xFF464772),
                            ),
                            child: Center(
                              child: textWithFont(text: "Statistics", color: Colors.white, fontFamily: 'ralewayLight', fontSize: 17, fontWeight: FontWeight.w600
                                ,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: Dimension.screenWidth * 0.42,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWithFont(text: "Performance", color: AppColor.neoBackground, fontFamily: 'ralewayLight', fontWeight: FontWeight.w600, fontSize: 15,),
                        SizedBox(height: Dimension.height5,),
                        Container(
                          width: Dimension.screenWidth * 0.3,
                          child: NeumorphicProgress(
                            style: ProgressStyle(
                              depth: -2,
                              lightSource: LightSource.topLeft,
                              borderRadius: BorderRadius.circular(15),
                              accent: Color(0xFFa33e4f)
                            ),
                            percent: 0.3,
                          ),
                        ),
                        SizedBox(height: Dimension.height10,),
                        textWithFont(text: "Efficiency", color: AppColor.neoBackground, fontFamily: 'ralewayLight', fontWeight: FontWeight.w600, fontSize: 15,),
                        SizedBox(height: Dimension.height5,),
                        Container(
                          width: Dimension.screenWidth * 0.3,
                          child: NeumorphicProgress(
                            style: ProgressStyle(
                                depth: -2,
                                lightSource: LightSource.topLeft,
                                borderRadius: BorderRadius.circular(15),
                                accent: Color(0xFF62a12f)
                            ),
                            percent: 0.8,
                          ),
                        ),
                        SizedBox(height: Dimension.height10,),
                        textWithFont(text: "Game Experience", color: AppColor.neoBackground, fontFamily: 'ralewayLight', fontWeight: FontWeight.w600, fontSize: 15,),
                        SizedBox(height: Dimension.height5,),
                        Container(
                          width: Dimension.screenWidth * 0.3,
                          child: NeumorphicProgress(
                            style: ProgressStyle(
                                depth: -2,
                                lightSource: LightSource.topLeft,
                                borderRadius: BorderRadius.circular(15),
                                accent: Color(0xFF204291)
                            ),
                            percent: 0.4,
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
            Positioned(
              top: Dimension.height10,
              right: Dimension.width10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.7,
                      surfaceIntensity: 0.5,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                      lightSource: LightSource.topLeft,
                      shadowLightColor: const Color(0xFF515283),
                      shadowDarkColor: const Color(0XFF3c3c61),
                      color: Color(0xFF464772),
                    ),
                    child: Container(
                      width: Dimension.screenWidth*0.09,
                      height: Dimension.screenHeight*0.04,
                      child: icon(),
                    ),
                  ),
                  SizedBox(height: Dimension.CustomSize(10),),
                  RotatedBox(
                      quarterTurns: 1,
                      child: textWithFont(text: Constant().verticalChill, color: AppColor.neoBackground, fontSize: 25, fontFamily: 'poesten',))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget icon(){
    int mode = Preferences.getInstance().getInt(SharedPreferenceKey.ModeActived) ?? 0;
    if(mode == 1){
    return Icon(MdiIcons.snowflakeVariant, size: 20, color: Colors.white,);
    }else if(mode == 2){
      return Icon(MdiIcons.brain, size: 20, color: Colors.white,);
    }else if(mode == 3){
      return SizedBox();
    }else if(mode == 4){
      return Icon(MdiIcons.speedometer, size: 20, color: Colors.white,);
    }else{
    //return SizedBox();
    return Icon(MdiIcons.setNone, size: 20, color: Colors.white,);
    }
  }

  void progressBarSet(int type){
    if(type == 1){
      performance = 0.3;
      efeciency = 0.7;
      experience = 0.4;
    }else if( type == 2){
      performance = 0.7;
      efeciency = 0.5;
      experience = 0.8;
    }else if(type == 4){
      performance = 1;
      efeciency = 0.2;
      experience = 1;
    }else{
      performance = 0.9;
      efeciency = 0.3;
      experience = 0.9;
    }
    setState((){});
  }

  Widget listCard(){
  return Container(
    width: Dimension.screenWidth,
    height: Dimension.screenHeight * 0.25,
    margin: EdgeInsets.only(
        top: Dimension.screenHeight * 0.01,
        right: Dimension.screenWidth * 0.05,
        left: Dimension.screenWidth * 0.05
    ),
    child: ScrollConfiguration(
      behavior: NoOverscrollBehavior(),
      child: ListView.builder(itemBuilder: (context, index) =>
          InkWell(
            onTap: (){

            },
            child: Container(
              margin: EdgeInsets.only(right: Dimension.width15),
              width: Dimension.screenWidth * 0.45,
              height: Dimension.screenHeight * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              child: CustomNeu().StdCustomSizeNormal(
                Dimension.screenWidth,
                Dimension.screenHeight,
                const Color(0xFF416450),
                const Color(0xFF57886c),
                const Color(0xFF4c765e),
                15,
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Lottie.asset(modelHomeCard[index].gambarIcon,
                            animate: true,
                            width: Dimension.CustomSize(110),
                            height: Dimension.CustomSize(110)
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: Dimension.CustomSize(10)),
                          child: textWithFont(text: modelHomeCard[index].namaFitur, color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900,)),
                      SizedBox(height: Dimension.CustomSize(20),),
                      Container(
                        width: Dimension.screenWidth,
                        margin: EdgeInsets.only(left: Dimension.CustomSize(10), right: Dimension.CustomSize(10)),
                        child: NeumorphicProgress(
                          height: Dimension.CustomSize(13),
                          style: ProgressStyle(
                              depth: -2,
                              lightSource: LightSource.topLeft,
                              borderRadius: BorderRadius.circular(15),
                              accent: Color(0xFF79bd96)
                          ),
                          percent: modelHomeCard[index].rankingProgress,
                        ),
                      ),
                      SizedBox(height: Dimension.CustomSize(15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: Dimension.CustomSize(10)),
                              child: textWithFont(text: "Rank", color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15, fontFamily: 'raleway',)),
                          Container(
                              margin: EdgeInsets.only(left: Dimension.CustomSize(10), right: Dimension.CustomSize(10),),
                              child: textWithFont(text: modelHomeCard[index].rankingFitur, color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'raleway',)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        itemCount: modelHomeCard.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,),
    )
  );
  }

  String ranking(int rank){
  String rankName = 'User';

  if(rank < 20){
    rankName = 'Nubie';
    return rankName;
  }else if(rank < 40){
    rankName = 'Enjoyer';
    return rankName;
  }else if(rank < 80){
    rankName = 'Madness';
    return rankName;
  }else if(rank <1000){
    rankName = 'Legends';
    return rankName;
  }else {
    rankName = 'PRO';
    return rankName;
  }
}

  double rankProgress(int rank){


    if(rank < 20){

      return 0.1;
    }else if(rank < 40){

      return 0.2;
    }else if(rank < 80){

      return 0.4;
    }else if(rank < 200){
      return 0.6;
    }else if(rank < 400){
      return 0.7;
    }else if(rank < 700){
      return 0.8;
    }else if(rank < 900){
      return 0.9;
    }else if(rank <1000){

      return 1;
    }else {

      return 0 ;
    }
  }

  int randomNumber(){
    int number = objectname.nextInt(1000);
  return number;
  }

}


import 'dart:async';
import 'dart:math';

import 'package:azure_reborn/widget/FlushBar.dart';
import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../additional/app_color.dart';
import '../../additional/constant.dart';
import '../../additional/dimension.dart';
import '../../helper/dialogs.dart';
import '../../model/home_body_model/chart_home_model.dart';
import '../../model/information_zram_model/zram_setting_model.dart';
import 'bloc/cpu_information_bloc.dart';

class CpuInformationPage extends StatefulWidget {
  const CpuInformationPage({Key? key}) : super(key: key);

  @override
  State<CpuInformationPage> createState() => _CpuInformationPageState();
}

class _CpuInformationPageState extends State<CpuInformationPage> {
  List<ChartDataModel> chartData = [];

  String swapType = "" ;

  int nextInt = 1, swappiness = 0, totalRam = 0;

  double core0 = 0, core1 = 0, core2 = 0, core3 = 0,core4 = 0 , core5 = 0, core6 = 0, core7 = 0;

  double swapTotal = 0, swapUsed = 0 ;

  double GPUThermal = 0, GPUMax = 0, GPUMin = 0, GPUFreq = 0;

  double memUsed = 0;

  ZramSettingModel? zramSettingModel;

  bool swapStatus = false;

  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CpuInformationBloc, CpuInformationState>(
        listener: (context, state) async {
          // TODO: implement listener
          if(state is onGetClockDataSucces){
            setState(() {
              chartData.add(ChartDataModel(coreName1: 'CORE'+state.nextInt.toStringAsFixed(1), clockSpeed: state.core7));
              core0 = state.core0;
              core1 = state.core1;
              core2 = state.core2;
              core3 = state.core3;
              core4 = state.core4;
              core5 = state.core5;
              core6 = state.core6;
              core7 = state.core7;
              nextInt = state.nextInt;

              swapType = state.swapType;
              swappiness = state.swappiness;
              swapTotal = (state.swapTotal * 0.000001);
              swapUsed = state.swapUsed ;

              memUsed = state.memUsed ;

              GPUThermal = state.GpuThermal;
              GPUMax   = state.gpuMax;
              GPUMin  = state.gpuMin;
              GPUFreq  = state.gpuFreq;

              String memT = state.memTotal.toStringAsFixed(0);

              if(swapTotal > 1){
                swapStatus = true;
              }else{
                swapStatus = false;
              }

              if(int.parse(memT)/1000000 > 6 && int.parse(memT)/1000000 < 9){
                totalRam = 8;
              }else if(int.parse(memT)/1000000 > 9){
                totalRam = 12;
              }
            });
            if(chartData.length > 10){
              chartData.removeAt(0);
            }
          }else if(state is doNothing){
            //Do Nothing
          }else if(state is onSetZramSettingSucces){
            FlushBarWidget.showSuccess("Zram Setting Applied").show(context);
          }else if(state is Failed){
            FlushBarWidget.showFailure(state.message).show(context);
          }
        },
        child: Container(
          color: AppColor.littleLightBlack,
          padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(15)),
          margin: EdgeInsets.only(top: Dimension.CustomSize(26)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primeCore(),
                  perfCore()

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  effCore(),
                  GPU()
                ],
              ),
              ramStatus(),
              additional()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      context.read<CpuInformationBloc>().add(onGetClockData(nextInt: nextInt));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
  //Widget Prime Core
  Widget primeCore() {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
        width: Dimension.screenWidth * 0.44,
        height: Dimension.screenHeight * 0.325,
        padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWithFont(text: "PRIME CORE", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900,),
            SizedBox(height: Dimension.size6,),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                    width: Dimension.screenWidth * 0.4,
                    height: Dimension.screenHeight * 0.27,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimension.CustomSize(60)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SfCartesianChart(
                              borderWidth: 0,
                              margin: EdgeInsets.all(0),
                              plotAreaBorderWidth: 0,
                              borderColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              primaryXAxis:
                              CategoryAxis(isVisible: false, plotOffset: 0, labelPlacement: LabelPlacement.onTicks, placeLabelsNearAxisLine: false),
                              primaryYAxis: NumericAxis(isVisible: false, plotBands: <PlotBand>[
                                PlotBand(
                                    opacity: 1,
                                    textAngle: 0,
                                    start: 0,
                                    end: 0,
                                    //Specify the width for the line
                                    borderWidth: 0,
                                    //Specify the dash array for the line
                                    dashArray: const <double>[4, 5])
                              ]),
                              series: <SplineAreaSeries<ChartDataModel, String>>[
                                // Renders column chart

                                //1 = silver, 2 = gold, 3 = performance
                                SplineAreaSeries<ChartDataModel, String>(
                                  color: AppColor.littleLightBlack,
                                  borderWidth: 1,
                                  dataSource: chartData,
                                  opacity: 0.7,
                                  borderColor: Colors.white,
                                  xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                  yValueMapper: (ChartDataModel data, _) => data.clockSpeed,
                                ),
                              ])),
                    ),
                  ),
                  Positioned(
                    left: Dimension.CustomSize(10),
                    top: Dimension.CustomSize(10),
                    child: Row(
                      children: [
                        Container(
                        width: Dimension.CustomSize(45),
                        height: Dimension.CustomSize(45),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.littleDarkSeaBlue,
                        ),
                          child: Center(child: textWithFont(text: core7.toStringAsFixed(1), color: Colors.black, fontSize: 23, fontWeight: FontWeight.w900,)),
                    ),
                        textWithFont(text: "Ghz", color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  //Widget Perf Core
  Widget perfCore(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
      width: Dimension.screenWidth * 0.44,
      height: Dimension.screenHeight * 0.325,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      child: Column(
        children: [
          textWithFont(text: "PERFORMANCE CORE", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900,),
          SizedBox(height: Dimension.size6,),
          Container(
            height: Dimension.screenHeight * 0.27,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(15)),
                  decoration: BoxDecoration(
                    color: AppColor.littleLightBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 4", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text: core4.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 30, fontWeight: FontWeight.w900,)),
                    ],
                  ),
                ),
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(15)),
                  decoration: BoxDecoration(
                    color: AppColor.littleLightBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 5", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text:  core5.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 30, fontWeight: FontWeight.w900,)),
                    ],
                  ),
                ),
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(15)),
                  decoration: BoxDecoration(
                    color: AppColor.littleLightBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 6", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text: core6.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 30, fontWeight: FontWeight.w900,)),
                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  //Widget Eff Core
  Widget effCore(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
      width: Dimension.screenWidth * 0.44,
      height: Dimension.screenHeight * 0.25,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 0", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: core0.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 1", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: core1.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 2", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: core2.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 3", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: core3.toStringAsFixed(1) +" Ghz", color: AppColor.littleDarkSeaBlue, fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: Dimension.screenWidth,
            height: Dimension.screenHeight * 0.05,
            padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
            child:
            Center(child: textWithFont(text: "EFFICIENCY CORE", color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900,)),
          )
        ],
      ),
    );
  }

  //Widget GPU
  Widget GPU(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
      width: Dimension.screenWidth * 0.44,
      height: Dimension.screenHeight * 0.25,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
            width: Dimension.screenWidth * 0.39,
            height: Dimension.screenHeight * 0.24,
            padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height:  Dimension.CustomSize(13),),
              textWithFont(text: "ADRENO 660", color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900,),
              SizedBox(height:  Dimension.CustomSize(40),),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
                width: Dimension.screenWidth * 0.36,
                height: Dimension.screenHeight * 0.11,
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWithFont(text: "SPEED", color: Colors.black, fontSize: 13, fontWeight: FontWeight.w900,),
                          SizedBox(height:  Dimension.CustomSize(10),),
                          textWithFont(text: GPUFreq.toStringAsFixed(0), color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900,),
                          textWithFont(text: "Mhz", color: Colors.black, fontSize: 13, fontWeight: FontWeight.w900,),

                        ],
                      ),
                    ),
                    Expanded(
                        flex:1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWithFont(text: "Min", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),
                                textWithFont(text: GPUMin.toStringAsFixed(0) + " Mhz", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWithFont(text: "Max", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),
                                textWithFont(text: GPUMax.toStringAsFixed(0) +" Mhz", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),

                              ],
                            )
                          ],
                        ))
                  ],
                ),
              )
              ],
            ),
          ),
          Positioned(
            right: Dimension.CustomSize(10),
            top: Dimension.CustomSize(10),
            child: Container(
              width: Dimension.CustomSize(37),
              height: Dimension.CustomSize(37),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.littleDarkSeaBlue,
              ),
              child: Center(child: textWithFont(text: GPUThermal.toStringAsFixed(0) + "℃", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,)),
            ),
          )
        ],
      ),
    );
  }

  //Widget Ram Status
  Widget ramStatus(){
    return Container(
      width:Dimension.screenWidth,
      height: Dimension.screenHeight * 0.18,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWithFont(text: "RANDOM ACCESS MEMORY", color: AppColor.littleLightBlack, fontSize: 19, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',),
                SizedBox(height: Dimension.CustomSize(2),),
                textWithFont(text: "UTILITIES & HARDWARE", color: AppColor.littleLightBlack, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'ralewayLight',),
                SizedBox(height: Dimension.CustomSize(15),),
                Row(
                  children: [
                    Icon(Icons.sd_storage, color: AppColor.littleLightBlack, size: 30,),
                    SizedBox(width: Dimension.CustomSize(4),),
                    textWithFont(text: totalRam.toString()+" GB", color: AppColor.littleLightBlack, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',),
                    SizedBox(width: Dimension.CustomSize(15),),
                    Icon(Icons.info, color: AppColor.littleLightBlack, size: 30,),
                    SizedBox(width: Dimension.CustomSize(4),),
                    textWithFont(text: "LPDDR 5", color: AppColor.littleLightBlack, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',),
                  ],
                ),
                SizedBox(height: Dimension.CustomSize(20),),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: Dimension.CustomSize(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: NeumorphicProgress(
                        style: ProgressStyle(
                            disableDepth: true,
                            borderRadius: BorderRadius.circular(25),
                            accent: AppColor.littleLightBlack,
                            variant: AppColor.littleLightBlack
                        ),
                        percent: memUsed,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      await Dialogs.zramSetting(buildContext: context, callback: (zramSettingModels){
                        zramSettingModel = zramSettingModels;
                      });
                      context.read<CpuInformationBloc>().add(onChangeZramSetting(
                        data: zramSettingModel!
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(10)),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleLightBlack),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: textWithFont(text: "ZRAM", color: AppColor.littleDarkSeaBlue, fontSize: 20, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)),
                          SizedBox(height: Dimension.CustomSize(15),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child:
                                  textWithFont(text: "SIZE", color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              ),
                              Expanded(
                                  child:
                                  textWithFont(text: swapTotal.toStringAsFixed(0) + " GB", color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              )
                            ],
                          ),
                          SizedBox(height: Dimension.CustomSize(2),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child:
                                  textWithFont(text: "TYPE", color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              ),
                              Expanded(
                                  child:
                                  textWithFont(text: swapType, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              )
                            ],
                          ),
                          SizedBox(height: Dimension.CustomSize(2),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child:
                                  textWithFont(text: "POWER", color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              ),
                              Expanded(
                                  child:
                                  textWithFont(text: swappiness.toString()+"%", color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold',)
                              )
                            ],
                          ),
                          SizedBox(height: Dimension.CustomSize(15),),
                          Expanded(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: NeumorphicProgress(
                                  style: ProgressStyle(
                                      disableDepth: true,
                                      borderRadius: BorderRadius.circular(25),
                                      accent: Color(0xFF7986F7),
                                      variant: Color(0xFF7986F7)
                                  ),
                                  percent: swapUsed,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Dimension.CustomSize(5),),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: swapStatus ? Icon(Icons.circle, size: 15, color: Colors.green,)
                          : Icon(Icons.circle, size: 15, color: Colors.red,)
                  )
                ],
              )),
        ],
      ),
      );

  }

  //Widget ETC
  Widget additional(){
    Random objectname = Random();
    int number = objectname.nextInt(QuotesRandom().quotesLenght());

    // await prefs.setString(SharedPreferenceKey.ProcessorKey.name, "SD888");
    // int day = DateTime.now().day;

    int day = DateTime.now().day;



    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:Dimension.screenWidth * 0.59,
          height: Dimension.screenHeight * 0.15,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
          padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWithFont(text: "QUOTES OF THE DAY",  color: AppColor.littleLightBlack, fontSize: 20, fontWeight: FontWeight.w900, fontFamily: 'openSansExtraBold'),
              SizedBox(height: Dimension.CustomSize(20),),
              textWithFont(text: QuotesRandom().quotes(number),  color: AppColor.littleLightBlack, fontSize: 16, fontWeight: FontWeight.w900,),
            ],
          ),
        ),
        Container(
          width:Dimension.screenWidth * 0.3,
          height: Dimension.screenHeight * 0.15,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.littleDarkSeaBlue),
          child: Image.asset('assets/image/img_data/additional_image.png', fit: BoxFit.fill,),
        ),
      ],
    );

  }
}

import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../additional/dimension.dart';
import '../../model/home_body_model/chart_home_model.dart';
import 'bloc/cpu_information_bloc.dart';

class CpuInformationPage extends StatefulWidget {
  const CpuInformationPage({Key? key}) : super(key: key);

  @override
  State<CpuInformationPage> createState() => _CpuInformationPageState();
}

class _CpuInformationPageState extends State<CpuInformationPage> {
  List<ChartDataModel> chartData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CpuInformationBloc, CpuInformationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Container(
          color: Color(0xFF353535),
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
              emptySpace()
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
    chartData.add(ChartDataModel(coreName1: 'CORE 7', clockSpeed: 3.2));
    chartData.add(ChartDataModel(coreName1: 'CORE 6', clockSpeed: 1.3));
    chartData.add(ChartDataModel(coreName1: 'CORE 4', clockSpeed: 2.4));
    chartData.add(ChartDataModel(coreName1: 'CORE 0', clockSpeed: 5.3));
    chartData.add(ChartDataModel(coreName1: 'CORE 06', clockSpeed: 4.1));
    chartData.add(ChartDataModel(coreName1: 'CORE 05', clockSpeed: 1.2));
    chartData.add(ChartDataModel(coreName1: 'CORE 04', clockSpeed: 3.8));
    chartData.add(ChartDataModel(coreName1: 'CORE 07', clockSpeed: 1));



  }
  //Widget Prime Core
  Widget primeCore() {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
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
                                  color: Color(0xFF353535),
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
                            color: Color(0xFF70D7DE),
                        ),
                          child: Center(child: textWithFont(text: "3.0", color: Colors.black, fontSize: 23, fontWeight: FontWeight.w900,)),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
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
                    color: Color(0xFF353535),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 4", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text: "2.9 Ghz", color: Color(0xFF70D7DE), fontSize: 30, fontWeight: FontWeight.w900,)),
                    ],
                  ),
                ),
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(15)),
                  decoration: BoxDecoration(
                    color: Color(0xFF353535),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 5", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text: "0.9 Ghz", color: Color(0xFF70D7DE), fontSize: 30, fontWeight: FontWeight.w900,)),
                    ],
                  ),
                ),
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.08,
                  padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(5), horizontal: Dimension.CustomSize(15)),
                  decoration: BoxDecoration(
                    color: Color(0xFF353535),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWithFont(text: "Core 6", color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900,),
                      SizedBox(height: Dimension.size6,),
                      Center(child: textWithFont(text: "1.4 Ghz", color: Color(0xFF70D7DE), fontSize: 30, fontWeight: FontWeight.w900,)),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 0", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: "1.4 Ghz", color: Color(0xFF70D7DE), fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 1", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: "1.7 Ghz", color: Color(0xFF70D7DE), fontSize: 15, fontWeight: FontWeight.w900,)),
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 2", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: "2.0 Ghz", color: Color(0xFF70D7DE), fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
                width: Dimension.screenWidth * 0.19,
                height: Dimension.screenHeight * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWithFont(text: "Core 3", color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900,),
                    SizedBox(height: Dimension.size12,),
                    Center(child: textWithFont(text: "0.4 Ghz", color: Color(0xFF70D7DE), fontSize: 15, fontWeight: FontWeight.w900,)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: Dimension.screenWidth,
            height: Dimension.screenHeight * 0.05,
            padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
      width: Dimension.screenWidth * 0.44,
      height: Dimension.screenHeight * 0.25,
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF353535)),
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
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
                          textWithFont(text: "844", color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900,),
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
                                textWithFont(text: "100 Mhz", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWithFont(text: "Max", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),
                                textWithFont(text: "844 Mhz", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,),

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
                color: Color(0xFF70D7DE),
              ),
              child: Center(child: textWithFont(text: "40℃", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900,)),
            ),
          )
        ],
      ),
    );
  }

  //Widget UNKNOW YET
  Widget emptySpace(){
    return Container(
      width:Dimension.screenWidth,
      height: Dimension.screenHeight * 0.34,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF70D7DE)),
      padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(10), horizontal: Dimension.CustomSize(10)),
      );

  }
}

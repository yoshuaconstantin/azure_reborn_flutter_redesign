import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../additional/dimension.dart';
import '../model/home_body_model/chart_home_model.dart';



class HomePresenceChart extends StatelessWidget {
  HomePresenceChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  List<ChartDataModel> chartData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.only(
              top: Dimension.CustomSize(15),
              right: Dimension.screenWidth * 0.05,
              left: Dimension.screenWidth * 0.05),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF16173d)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.006, left: 15),
                          child: Icon(
                            MdiIcons.chartBar,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SfCartesianChart(
                              borderWidth: 0,
                              margin: EdgeInsets.all(0),
                              plotAreaBorderWidth: 0,
                              borderColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              primaryXAxis: CategoryAxis(
                                  isVisible: false, plotOffset: 0, labelPlacement: LabelPlacement.onTicks, placeLabelsNearAxisLine: false),
                              primaryYAxis: NumericAxis(isVisible: false, plotBands: <PlotBand>[
                                PlotBand(
                                    opacity: 1,
                                    textAngle: 0,
                                    start: 0,
                                    end: 0,
                                    borderColor: Colors.red,
                                    //Specify the width for the line
                                    borderWidth: 2,
                                    //Specify the dash array for the line
                                    dashArray: const <double>[4, 5])
                              ]),
                              series: <StackedLine100Series<ChartDataModel, String>>[
                                // Renders column chart
                                StackedLine100Series<ChartDataModel, String>(
                                  color: Color(0xFF101370),

                                  dataSource: chartData,
                                  opacity: 0.7,

                                  // gradient: const LinearGradient(
                                  //     colors: <Color>[
                                  //       Color(0xFF12c2e9),
                                  //       Color(0xFFc471ed),
                                  //       Color(0xFFf64f59)
                                  //     ],
                                  //
                                  // ),
                                  // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                  xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                  yValueMapper: (ChartDataModel data, _) => data.speed1,
                                ),
                                StackedLine100Series<ChartDataModel, String>(
                                  dataSource: chartData,
                                  opacity: 0.7,
                                  // gradient: const LinearGradient(
                                  //     colors: <Color>[
                                  //       Color(0xFF12c2e9),
                                  //       Color(0xFFc471ed),
                                  //       Color(0xFFf64f59)
                                  //     ],
                                  //
                                  // ),
                                  // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                  xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                  yValueMapper: (ChartDataModel data, _) => data.speed2,
                                ),
                                StackedLine100Series<ChartDataModel, String>(
                                  dataSource: chartData,
                                  opacity: 0.7,
                                  // gradient: const LinearGradient(
                                  //     colors: <Color>[
                                  //       Color(0xFF12c2e9),
                                  //       Color(0xFFc471ed),
                                  //       Color(0xFFf64f59)
                                  //     ],
                                  //
                                  // ),
                                  // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                  xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                  yValueMapper: (ChartDataModel data, _) => data.speed3,
                                ),
                                // SplineAreaSeries<ChartDataModel, String>(
                                //   borderWidth: 3,
                                //   dataSource: chartData,
                                //   opacity: 0.7,
                                //   borderColor: Color(0xFF49a7cc),
                                //   // gradient: const LinearGradient(
                                //   //     colors: <Color>[
                                //   //       Color(0xFF12c2e9),
                                //   //       Color(0xFFc471ed),
                                //   //       Color(0xFFf64f59)
                                //   //     ],
                                //   //
                                //   // ),
                                //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                //   yValueMapper: (ChartDataModel data, _) => data.speed4,
                                // ),
                                // SplineAreaSeries<ChartDataModel, String>(
                                //   borderWidth: 3,
                                //   dataSource: chartData,
                                //   opacity: 0.7,
                                //   borderColor: Color(0xFF49a7cc),
                                //   // gradient: const LinearGradient(
                                //   //     colors: <Color>[
                                //   //       Color(0xFF12c2e9),
                                //   //       Color(0xFFc471ed),
                                //   //       Color(0xFFf64f59)
                                //   //     ],
                                //   //
                                //   // ),
                                //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                //   yValueMapper: (ChartDataModel data, _) => data.speed5,
                                // ),
                                // SplineAreaSeries<ChartDataModel, String>(
                                //   borderWidth: 3,
                                //   dataSource: chartData,
                                //   opacity: 0.7,
                                //   borderColor: Color(0xFFd1c05c),
                                //   // gradient: const LinearGradient(
                                //   //     colors: <Color>[
                                //   //       Color(0xFF12c2e9),
                                //   //       Color(0xFFc471ed),
                                //   //       Color(0xFFf64f59)
                                //   //     ],
                                //   //
                                //   // ),
                                //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                //   yValueMapper: (ChartDataModel data, _) => data.speed6,
                                // ),
                                // SplineAreaSeries<ChartDataModel, String>(
                                //   borderWidth: 3,
                                //   dataSource: chartData,
                                //   opacity: 0.7,
                                //   borderColor: Color(0xFFc79273),
                                //   // gradient: const LinearGradient(
                                //   //     colors: <Color>[
                                //   //       Color(0xFF12c2e9),
                                //   //       Color(0xFFc471ed),
                                //   //       Color(0xFFf64f59)
                                //   //     ],
                                //   //
                                //   // ),
                                //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                //   yValueMapper: (ChartDataModel data, _) => data.speed7,
                                // ),
                                // SplineAreaSeries<ChartDataModel, String>(
                                //   borderWidth: 3,
                                //   dataSource: chartData,
                                //   opacity: 0.7,
                                //   borderColor: Color(0xFF31264a),
                                //   // gradient: const LinearGradient(
                                //   //     colors: <Color>[
                                //   //       Color(0xFF12c2e9),
                                //   //       Color(0xFFc471ed),
                                //   //       Color(0xFFf64f59)
                                //   //     ],
                                //   //
                                //   // ),
                                //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
                                //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
                                //   yValueMapper: (ChartDataModel data, _) => data.speed8,
                                // )
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),

            ],
          )),
    );
  }

}

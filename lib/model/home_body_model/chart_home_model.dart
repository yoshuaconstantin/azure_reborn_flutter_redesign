class ChartDataModel {
  String coreName1;
  int clockSpeed;

  ChartDataModel({required this.coreName1, required this.clockSpeed});
}

//Container(
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.transparent),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: SfCartesianChart(
//                               borderWidth: 0,
//                               margin: EdgeInsets.all(0),
//                               plotAreaBorderWidth: 0,
//                               borderColor: Colors.transparent,
//                               backgroundColor: Colors.transparent,
//                               primaryXAxis: CategoryAxis(
//                                   isVisible: false, plotOffset: 0, labelPlacement: LabelPlacement.onTicks, placeLabelsNearAxisLine: false),
//                               primaryYAxis: NumericAxis(isVisible: false, plotBands: <PlotBand>[
//                                 PlotBand(
//                                     opacity: 1,
//                                     textAngle: 0,
//                                     start: 0,
//                                     end: 0,
//                                     borderColor: Colors.red,
//                                     //Specify the width for the line
//                                     borderWidth: 2,
//                                     //Specify the dash array for the line
//                                     dashArray: const <double>[4, 5])
//                               ]),
//                               series: <SplineAreaSeries<ChartDataModel, String>>[
//                                 // Renders column chart
//
//                                 //1 = silver, 2 = gold, 3 = performance
//                                   SplineAreaSeries<ChartDataModel, String>(
//                                     color: Color(0xFF101370),
//                                     borderWidth: 3,
//                                     dataSource: chartData,
//                                     opacity: 0.7,
//                                     borderColor: Color(0xFF485cf7),
//                                     // gradient: const LinearGradient(
//                                     //     colors: <Color>[
//                                     //       Color(0xFF12c2e9),
//                                     //       Color(0xFFc471ed),
//                                     //       Color(0xFFf64f59)
//                                     //     ],
//                                     //
//                                     // ),
//                                     // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                     xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                     yValueMapper: (ChartDataModel data, _) => data.clockSpeed,
//                                   ),
//                                 // SplineAreaSeries<ChartDataModel, String>(
//                                 //   borderWidth: 3,
//                                 //   dataSource: chartData,
//                                 //   opacity: 0.7,
//                                 //   borderColor: Color(0xFF49a7cc),
//                                 //   // gradient: const LinearGradient(
//                                 //   //     colors: <Color>[
//                                 //   //       Color(0xFF12c2e9),
//                                 //   //       Color(0xFFc471ed),
//                                 //   //       Color(0xFFf64f59)
//                                 //   //     ],
//                                 //   //
//                                 //   // ),
//                                 //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                 //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                 //   yValueMapper: (ChartDataModel data, _) => data.speed4,
//                                 // ),
//                                 // SplineAreaSeries<ChartDataModel, String>(
//                                 //   borderWidth: 3,
//                                 //   dataSource: chartData,
//                                 //   opacity: 0.7,
//                                 //   borderColor: Color(0xFF49a7cc),
//                                 //   // gradient: const LinearGradient(
//                                 //   //     colors: <Color>[
//                                 //   //       Color(0xFF12c2e9),
//                                 //   //       Color(0xFFc471ed),
//                                 //   //       Color(0xFFf64f59)
//                                 //   //     ],
//                                 //   //
//                                 //   // ),
//                                 //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                 //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                 //   yValueMapper: (ChartDataModel data, _) => data.speed5,
//                                 // ),
//                                 // SplineAreaSeries<ChartDataModel, String>(
//                                 //   borderWidth: 3,
//                                 //   dataSource: chartData,
//                                 //   opacity: 0.7,
//                                 //   borderColor: Color(0xFFd1c05c),
//                                 //   // gradient: const LinearGradient(
//                                 //   //     colors: <Color>[
//                                 //   //       Color(0xFF12c2e9),
//                                 //   //       Color(0xFFc471ed),
//                                 //   //       Color(0xFFf64f59)
//                                 //   //     ],
//                                 //   //
//                                 //   // ),
//                                 //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                 //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                 //   yValueMapper: (ChartDataModel data, _) => data.speed6,
//                                 // ),
//                                 // SplineAreaSeries<ChartDataModel, String>(
//                                 //   borderWidth: 3,
//                                 //   dataSource: chartData,
//                                 //   opacity: 0.7,
//                                 //   borderColor: Color(0xFFc79273),
//                                 //   // gradient: const LinearGradient(
//                                 //   //     colors: <Color>[
//                                 //   //       Color(0xFF12c2e9),
//                                 //   //       Color(0xFFc471ed),
//                                 //   //       Color(0xFFf64f59)
//                                 //   //     ],
//                                 //   //
//                                 //   // ),
//                                 //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                 //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                 //   yValueMapper: (ChartDataModel data, _) => data.speed7,
//                                 // ),
//                                 // SplineAreaSeries<ChartDataModel, String>(
//                                 //   borderWidth: 3,
//                                 //   dataSource: chartData,
//                                 //   opacity: 0.7,
//                                 //   borderColor: Color(0xFF31264a),
//                                 //   // gradient: const LinearGradient(
//                                 //   //     colors: <Color>[
//                                 //   //       Color(0xFF12c2e9),
//                                 //   //       Color(0xFFc471ed),
//                                 //   //       Color(0xFFf64f59)
//                                 //   //     ],
//                                 //   //
//                                 //   // ),
//                                 //   // xValueMapper: (ChartDataModel data, _) => num.parse(data.timeIn!) == 0 ? null : DateFormat('yyyy-MM-dd hh.mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!))).toString(),
//                                 //   xValueMapper: (ChartDataModel data, _) => data.coreName1,
//                                 //   yValueMapper: (ChartDataModel data, _) => data.speed8,
//                                 // )
//                               ]),
//                         ),
//                       ),
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../additional/dimension.dart';
import '../model/home_body_model/chart_home_model.dart';

class HomePresenceChart extends StatelessWidget {
  HomePresenceChart({Key? key, required this.chartData, required this.type}) : super(key: key);

  List<ChartDataModel> chartData;
  int type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery
          .of(context)
          .size
          .width * 0.04, right: MediaQuery
          .of(context)
          .size
          .width * 0.04),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.25,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.25,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(17), bottomRight: Radius.circular(17), bottomLeft: Radius.circular(17)),
                          color: Color(0xFF99D5C9)),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 3,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(10),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.013),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Shift : ",
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xFF2D0320))),
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.002,
                                    ),
                                    Text("TESTING",
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF2D0320))),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() =>
                      {

                      }),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.127,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(17), bottomRight: Radius.circular(17), bottomLeft: Radius.circular(17)),
                            color: Color(0xFF645E9D)),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 3,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.all(10),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.013),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Shift : ",
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Color(0xFF99D5C9))),
                                        SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.006,
                                        ),
                                        Text("TESTING",
                                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Color(0xFF99D5C9))),
                                        SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.01,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Positioned(
                              bottom: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                              child: Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.4,
                                decoration: BoxDecoration(
                                  color: Color(0xFF373363),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child:  Center(
                                  child: Text("TESTING",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17), bottomRight: Radius.circular(17), bottomLeft: Radius.circular(17)),
                          color: Color(0xFF99D5C9)),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 3,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(10),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.013),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Shift : ",
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xFF2D0320))),
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.002,
                                    ),
                                    Text("yyyy",
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF2D0320))),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() =>
                      {

                      }),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.127,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17), bottomRight: Radius.circular(17), bottomLeft: Radius.circular(17)),
                            color: Color(0xFF645E9D)),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 3,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.all(10),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.013),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Shift : ",
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Color(0xFF99D5C9))),
                                        SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.006,
                                        ),
                                        Text("ggggg",
                                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Color(0xFF99D5C9))),
                                        SizedBox(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.01,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Positioned(
                              bottom: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                              child: Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.4,
                                decoration: BoxDecoration(
                                  color: Color(0xFF373363),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Center(
                                  child: Text("gggggg",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


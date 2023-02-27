import 'dart:io';

import 'package:azure_reborn/helper/bottom_sheets.dart';
import 'package:azure_reborn/widget/FlushBar.dart';
import 'package:azure_reborn/widget/text_with_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../additional/dimension.dart';
import '../model/information_zram_model/zram_setting_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Dialogs {
  static Future<void> message({
    required BuildContext buildContext,
    required String title,
    String? message,
    String? dismiss,
    bool showButton = true,
    bool cancelable = true
  }) {
    Widget? content;

    if (message != null) {
      content = SingleChildScrollView(
        child: Text(message),
      );
    }

    List<Widget> actions = [];

    if (showButton) {
      actions.add(
          TextButton(
              child: Text(dismiss ?? "Mengerti"),
              onPressed: () => Navigator.of(buildContext).pop()
          )
      );
    }

    return showDialog(
        context: buildContext,
        builder: (BuildContext buildContext) {
          return AlertDialog(
              title: Text(title),
              content: content,
              actions: actions
          );
        }
    );
  }

  static Future<void> confirmation({
    required BuildContext buildContext,
    required String title,
    String? message,
    String? negative,
    String? positive,
    bool cancelable = true,
    VoidCallback? negativeCallback,
    VoidCallback? positiveCallback
  }) {
    Widget? content;

    if (message != null) {
      content = SingleChildScrollView(
        child: Text(message),
      );
    }

    return showDialog(
        context: buildContext,
        builder: (BuildContext buildContext) {
          return AlertDialog(
              title: Text(title),
              content: content,
              actions: [
                TextButton(
                    child: Text(negative ?? "No"),
                    onPressed: () {
                      Navigator.of(buildContext).pop();

                      if (negativeCallback != null) {
                        negativeCallback.call();
                      }
                    }
                ),
                TextButton(
                    child: Text(positive ?? "Yes"),
                    onPressed: () {
                      Navigator.of(buildContext).pop();

                      if (positiveCallback != null) {
                        positiveCallback.call();
                      }
                    }
                )
              ]
          );
        }
    );
  }



  static Future<void> zramSetting({
    required BuildContext buildContext,
    required void Function(ZramSettingModel zramModel) callback
  }) {
    return showDialog(
        context: buildContext,
        builder: (context) {
          double size = 0, pwr = 1, cpwr = 1;
          int minfree = 0, dirtyRatio = 0, bgrndRatio = 0;
          String algorithm = "";

          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              backgroundColor: Color(0xFF303030),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius30)
                ),
                content: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWithFont(text: "ZRAM SETTING", color: Color(0xFF79F7FF), fontFamily: 'openSansExtraBold', fontSize: 30, fontWeight: FontWeight.w500),
                        SizedBox(height: Dimension.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SfSliderTheme(
                                      data: SfSliderThemeData(
                                        activeTrackHeight: Dimension.CustomSize(27),
                                        inactiveTrackHeight: Dimension.CustomSize(27),
                                        activeTrackColor: Color(0xFF7986F7),
                                        inactiveTrackColor: Colors.white,
                                        overlayRadius: 0,
                                        overlayColor: Colors.transparent,
                                        activeDividerStrokeWidth: 0,
                                        thumbStrokeColor: Colors.transparent,
                                        thumbColor: Color(0xFF7986F7),
                                        thumbRadius: 14,

                                      ),
                                      child: Container(
                                        height: Dimension.screenHeight * 0.18,

                                        child: SfSlider.vertical(
                                            min: 0 ,
                                            max: 8,
                                            stepSize: 2,
                                            value: size,
                                            onChanged: (value1){
                                              setState ((){
                                                HapticFeedback.lightImpact();
                                                size = value1;
                                              });
                                            }),
                                      ),
                                    ),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: size.toStringAsFixed(0)+"GB", color: Color(0xFF79F7FF), fontFamily: 'openSansExtraBold', fontSize: 15, fontWeight: FontWeight.w500),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: "SIZE", color: Colors.white, fontFamily: 'openSansExtraBold', fontSize: 18, fontWeight: FontWeight.w500),

                                  ],
                                ),
                                SizedBox(width: Dimension.size12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SfSliderTheme(
                                      data: SfSliderThemeData(
                                        activeTrackHeight: Dimension.CustomSize(27),
                                        inactiveTrackHeight: Dimension.CustomSize(27),
                                        activeTrackColor: Color(0xFF7986F7),
                                        inactiveTrackColor: Colors.white,
                                        overlayRadius: 0,
                                        overlayColor: Colors.transparent,
                                        activeDividerStrokeWidth: 0,
                                        thumbStrokeColor: Colors.transparent,
                                        thumbColor: Color(0xFF7986F7),
                                        thumbRadius: 14,

                                      ),
                                      child: Container(
                                        height: Dimension.screenHeight * 0.18,

                                        child: SfSlider.vertical(
                                            min: 1 ,
                                            max: 100,
                                            stepSize: 1,
                                            value: pwr,
                                            onChanged: (value2){
                                              setState ((){
                                                if(value2 % 10 == 0){
                                                  HapticFeedback.lightImpact();
                                                }
                                                pwr = value2;
                                              });
                                            }),
                                      ),
                                    ),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: pwr.toStringAsFixed(0)+"%", color: Color(0xFF79F7FF), fontFamily: 'openSansExtraBold', fontSize: 15, fontWeight: FontWeight.w500),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: "PWR", color: Colors.white, fontFamily: 'openSansExtraBold', fontSize: 18, fontWeight: FontWeight.w500),

                                  ],
                                ),
                                SizedBox(width: Dimension.size12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SfSliderTheme(
                                      data: SfSliderThemeData(
                                        activeTrackHeight: Dimension.CustomSize(27),
                                        inactiveTrackHeight: Dimension.CustomSize(27),
                                        activeTrackColor: Color(0xFF7986F7),
                                        inactiveTrackColor: Colors.white,
                                        overlayRadius: 0,
                                        overlayColor: Colors.transparent,
                                        activeDividerStrokeWidth: 0,
                                        thumbStrokeColor: Colors.transparent,
                                        thumbColor: Color(0xFF7986F7),
                                        thumbRadius: 14,

                                      ),
                                      child: Container(
                                        height: Dimension.screenHeight * 0.18,

                                        child: SfSlider.vertical(
                                            min: 1 ,
                                            max: 100,
                                            stepSize: 1,
                                            value: cpwr,
                                            onChanged: (value3){
                                              setState ((){
                                                if(value3 % 10 == 0){
                                                  HapticFeedback.lightImpact();
                                                }
                                                cpwr = value3;
                                              });
                                            }),
                                      ),
                                    ),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: cpwr.toStringAsFixed(0)+"%", color: Color(0xFF79F7FF), fontFamily: 'openSansExtraBold', fontSize: 15, fontWeight: FontWeight.w500),
                                    SizedBox(height: Dimension.CustomSize(2),),
                                    textWithFont(text: "CWR", color: Colors.white, fontFamily: 'openSansExtraBold', fontSize: 18, fontWeight: FontWeight.w500),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: Dimension.size12,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async{
                                      List<SpinnerItem> spinnerItems = [];

                                      List<String> comp_alg = ["zstd","lz4","lzo-rle","lzo"];

                                      for(int i =0;i <comp_alg.length; i++){
                                        spinnerItems.add( SpinnerItem(
                                            identity: i,
                                            description: comp_alg[i]
                                        ));
                                      }

                                      await BottomSheets.spinner(
                                          context: context,
                                          title: "Zram Algorithm",
                                          spinnerItems: spinnerItems,
                                          onSelected: (selectedItem){
                                            algorithm = selectedItem.description;
                                          }
                                      );

                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF2D033B)),
                                      padding: EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          textWithFont(text: "ALGORITHM", color: Color(0xFFE5B8F4), fontFamily: 'openSansExtraBold', fontSize: 14, fontWeight: FontWeight.w500),
                                          SizedBox(width: Dimension.size4,),
                                          Icon(Icons.more_vert, size: 25, color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimension.size6,),
                                  InkWell(
                                    onTap: () async {
                                      List<SpinnerItem> spinnerItems = [];

                                      int minfree = 1024;
                                      for(int i = 0; i<8; i++){
                                        minfree = minfree + minfree;
                                        spinnerItems.add( SpinnerItem(
                                            identity: i,
                                            description: minfree.toString()+"KB",
                                            tag: minfree));
                                      }

                                      await BottomSheets.spinner(
                                          context: context,
                                          title: "MinFree Kilo Bytes",
                                          spinnerItems: spinnerItems,
                                          onSelected: (selectedItem){
                                            minfree = selectedItem.tag;
                                          }
                                      );

                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF2D033B)),
                                      padding: EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          textWithFont(text: "MIN FREE", color: Color(0xFFE5B8F4), fontFamily: 'openSansExtraBold', fontSize: 14, fontWeight: FontWeight.w500),
                                          SizedBox(width: Dimension.size4,),
                                          Icon(Icons.more_vert, size: 25, color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimension.size6,),
                                  InkWell(
                                    onTap: () async{
                                      List<SpinnerItem> spinnerItems = [];
                                      int step = 10;
                                      for(int i = 0; i<=100; i+=step){
                                        spinnerItems.add( SpinnerItem(
                                            identity: i,
                                            description: i.toString()+"%",
                                            tag: i));
                                      }

                                      await BottomSheets.spinner(
                                          context: context,
                                          title: "Dirty Ratio",
                                          spinnerItems: spinnerItems,
                                          onSelected: (selectedItem){
                                            dirtyRatio = selectedItem.tag;
                                          }
                                      );
            
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF2D033B)),
                                      padding: EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          textWithFont(text: "DIRTY RATIO", color: Color(0xFFE5B8F4), fontFamily: 'openSansExtraBold', fontSize: 14, fontWeight: FontWeight.w500),
                                          SizedBox(width: Dimension.size4,),
                                          Icon(Icons.more_vert, size: 25, color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimension.size6,),
                                  InkWell(
                                    onTap: () async{
                                      List<SpinnerItem> spinnerItems = [];
                                      int step = 10;
                                      for(int i = 0; i<=100; i+=step){
                                        spinnerItems.add( SpinnerItem(
                                            identity: i,
                                            description: i.toString()+"%",
                                            tag: i));
                                      }

                                      await BottomSheets.spinner(
                                          context: context,
                                          title: "Background Ratio",
                                          spinnerItems: spinnerItems,
                                          onSelected: (selectedItem){
                                            bgrndRatio = selectedItem.tag;
                                          }
                                      );

                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF2D033B)),
                                      padding: EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          textWithFont(text: "BG.RATIO", color: Color(0xFFE5B8F4), fontFamily: 'openSansExtraBold', fontSize: 14, fontWeight: FontWeight.w500),
                                          SizedBox(width: Dimension.size4,),
                                          Icon(Icons.more_vert, size: 25, color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: Dimension.CustomSize(25),)
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(Icons.info, size: 25, color: Colors.white,)),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            callback.call( ZramSettingModel(
                                size: size.floor(),
                                power: pwr.floor(),
                                cachePower: cpwr.floor(),
                                algorithm: algorithm,
                                minfree: minfree,
                                dirtyRatio: dirtyRatio.floor(),
                                backgroundRatio: bgrndRatio.floor()
                            ));

                            FlushBarWidget.showSuccess("Zram Setting Saved!").show(context).whenComplete(() => Navigator.pop(context));
                          },
                          child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2D033B)),
                              height: Dimension.CustomSize(50),
                              width: Dimension.CustomSize(50),
                              child: Icon(Icons.save, size: 30, color: Colors.white,)),
                        )),
                  ],
                ),

                actionsPadding: EdgeInsets.only(
                    right: Dimension.width20,
                    bottom: Dimension.height20
                )
            ),
          );
        }
    );
  }
}
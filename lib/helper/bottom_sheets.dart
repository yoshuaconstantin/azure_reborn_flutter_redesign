import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../additional/dimension.dart';
import '../widget/custom_app_bar.dart';
import '../widget/text_sheet.dart';
import 'navigators.dart';



class BottomSheets {
  static Future<dynamic> standard({
    required BuildContext context,
    required Widget widget
  }) async {
    return await showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return Column(
                    children: [
                      SizedBox(
                          height: Dimension.screenHeight * 0.046
                      ),
                      Expanded(
                          child: widget
                      )
                    ]
                );
              }
          );
        }
    );
  }

  static Future<dynamic> dismissable({
    required BuildContext context,
    required Widget widget
  }) async {
    return await showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimension.radius30),
              topRight: Radius.circular(Dimension.radius30),
            )
        ),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return Column(
                    children: [
                      SizedBox(
                          height: Dimension.screenHeight * 0.05
                      ),
                      Container(
                        height: Dimension.height5,
                        width: Dimension.screenWidth * 0.1,
                        margin: EdgeInsets.only(top: Dimension.height10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                                Dimension.radius30)
                        ),
                      ),
                      Expanded(
                          child: widget
                      )
                    ]
                );
              }
          );
        }
    );
  }


  static Future<dynamic> spinner({
    required BuildContext context,
    required String title,
    String? messageEmpty,
    required List<SpinnerItem> spinnerItems,
    required void Function(SpinnerItem selectedItem) onSelected
  }) async {
    TextEditingController textEditingController = TextEditingController();
    List<SpinnerItem> filteredSpinnerItems = [];

    filteredSpinnerItems.addAll(spinnerItems);

    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {

          return StatefulBuilder(
              builder: (context, setState) {
                return Material(
                    child: Column(
                        children: [
                          SizedBox(
                              height: Dimension.screenHeight * 0.046
                          ),
                          Expanded(
                              child: Scaffold(
                                  appBar: CustomAppBar(
                                      title: title,
                                      arrowBackTapped: () => Navigators.pop(context)
                                  ),
                                  body: spinnerItems.isNotEmpty ? SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Dimension.width20
                                              ),
                                              child: TextField(
                                                  controller: textEditingController,
                                                  cursorColor: Colors.red,
                                                  textInputAction: TextInputAction.search,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.redAccent,
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(Dimension.radius30 * 2),
                                                          borderSide: BorderSide.none
                                                      ),
                                                      contentPadding: EdgeInsets.symmetric(
                                                          horizontal: Dimension.width20
                                                      ),
                                                      hintText: 'Cari...',
                                                      hintStyle: const TextStyle(
                                                          fontWeight: FontWeight.w500
                                                      )
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      filteredSpinnerItems.clear();

                                                      if (StringUtils.isNotNullOrEmpty(textEditingController.text)) {
                                                        for (SpinnerItem spinnerItem in spinnerItems) {
                                                          if (spinnerItem.description.toLowerCase().contains(textEditingController.text.toLowerCase())) {
                                                            filteredSpinnerItems.add(spinnerItem);
                                                          }
                                                        }
                                                      } else {
                                                        filteredSpinnerItems.addAll(spinnerItems);
                                                      }
                                                    });
                                                  }
                                              )
                                          ),
                                          SizedBox(
                                            height: Dimension.height20,
                                          ),
                                          ListView.separated(
                                              itemCount: filteredSpinnerItems.length,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                SpinnerItem spinnerItem = filteredSpinnerItems[index];

                                                return ListTile(
                                                    onTap: () {
                                                      onSelected(spinnerItem);

                                                      Navigators.pop(context);
                                                    },
                                                    title: TextSheet(
                                                        text: spinnerItem.description,
                                                        size: Dimension.size14
                                                    ),
                                                    subtitle: spinnerItem.subDescription != null ? TextSheet(
                                                        text: spinnerItem.subDescription.toString(),
                                                        size: Dimension.size12,
                                                        fontWeight: FontWeight.w400,
                                                    ) : null,
                                                    contentPadding: EdgeInsets.only(
                                                        left: Dimension.width25,
                                                        right: Dimension.width25
                                                    )
                                                );
                                              },
                                              separatorBuilder: (BuildContext context, int index) {
                                                return const Divider(
                                                    height: 1,
                                                    color: Colors.grey
                                                );
                                              }
                                          )
                                        ],
                                      )
                                  ) : Center(child: Padding(
                                    padding: EdgeInsets.all(Dimension.width20),
                                    child: Text(messageEmpty.toString() == 'null' ? 'Gagal memuat data' : messageEmpty.toString(), textAlign: TextAlign.center),
                                  ))
                              )
                          )
                        ]
                    )
                );
              }
          );
        }
    );
  }

  static Future<dynamic> halfSpinner({
    required BuildContext context,
    required String title,
    String? messageEmpty,
    required List<SpinnerItem> spinnerItems,
    required void Function(SpinnerItem selectedItem) onSelected
  }) async {
    TextEditingController textEditingController = TextEditingController();
    List<SpinnerItem> filteredSpinnerItems = [];

    filteredSpinnerItems.addAll(spinnerItems);

    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {

          return StatefulBuilder(
              builder: (context, setState) {
                return Material(
                    child: Column(
                        children: [
                          SizedBox(
                              height: Dimension.screenHeight * 0.046
                          ),
                          FractionallySizedBox(
                              heightFactor: 0.5,
                              child: Scaffold(
                                  appBar: CustomAppBar(
                                      title: title,
                                      arrowBackTapped: () => Navigators.pop(context)
                                  ),
                                  body: spinnerItems.isNotEmpty ? SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Dimension.width20
                                              ),
                                              child: TextField(
                                                  controller: textEditingController,
                                                  cursorColor: Colors.red,
                                                  textInputAction: TextInputAction.search,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.redAccent,
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(Dimension.radius30 * 2),
                                                          borderSide: BorderSide.none
                                                      ),
                                                      contentPadding: EdgeInsets.symmetric(
                                                          horizontal: Dimension.width20
                                                      ),
                                                      hintText: 'Cari...',
                                                      hintStyle: const TextStyle(
                                                          fontWeight: FontWeight.w500
                                                      )
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      filteredSpinnerItems.clear();

                                                      if (StringUtils.isNotNullOrEmpty(textEditingController.text)) {
                                                        for (SpinnerItem spinnerItem in spinnerItems) {
                                                          if (spinnerItem.description.toLowerCase().contains(textEditingController.text.toLowerCase())) {
                                                            filteredSpinnerItems.add(spinnerItem);
                                                          }
                                                        }
                                                      } else {
                                                        filteredSpinnerItems.addAll(spinnerItems);
                                                      }
                                                    });
                                                  }
                                              )
                                          ),
                                          SizedBox(
                                            height: Dimension.height20,
                                          ),
                                          ListView.separated(
                                              itemCount: filteredSpinnerItems.length,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                SpinnerItem spinnerItem = filteredSpinnerItems[index];

                                                return ListTile(
                                                    onTap: () {
                                                      onSelected(spinnerItem);

                                                      Navigators.pop(context);
                                                    },
                                                    title: TextSheet(
                                                        text: spinnerItem.description,
                                                        size: Dimension.size14
                                                    ),
                                                    subtitle: spinnerItem.subDescription != null ? TextSheet(
                                                      text: spinnerItem.subDescription.toString(),
                                                      size: Dimension.size12,
                                                      fontWeight: FontWeight.w400,
                                                    ) : null,
                                                    contentPadding: EdgeInsets.only(
                                                        left: Dimension.width25,
                                                        right: Dimension.width25
                                                    )
                                                );
                                              },
                                              separatorBuilder: (BuildContext context, int index) {
                                                return const Divider(
                                                    height: 1,
                                                    color: Colors.grey
                                                );
                                              }
                                          )
                                        ],
                                      )
                                  ) : Center(child: Padding(
                                    padding: EdgeInsets.all(Dimension.width20),
                                    child: Text(messageEmpty.toString() == 'null' ? 'Gagal memuat data' : messageEmpty.toString(), textAlign: TextAlign.center),
                                  ))
                              )
                          )
                        ]
                    )
                );
              }
          );
        }
    );
  }


  static Future<dynamic> half({
    required BuildContext context,
    required Widget widget
  }) async {
    return await showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return Column(
                    children: [
                      SizedBox(
                          height: Dimension.screenHeight * 0.046
                      ),
                      Expanded(
                          child: widget
                      )
                    ]
                );
              }
          );
        }
    );
  }

  static Future<dynamic> fitContent({
    required BuildContext context,
    required Widget widget
  }) async {
    return await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimension.radius15),
              topRight: Radius.circular(Dimension.radius15),
            )
        ),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return widget;
              }
          );
        }
    );
  }
}

class SpinnerItem {
  final dynamic identity;
  final String description;
  final dynamic tag;
  final String? subDescription;

  SpinnerItem({
    required this.identity,
    required this.description,
    this.tag,
    this.subDescription
  });
}
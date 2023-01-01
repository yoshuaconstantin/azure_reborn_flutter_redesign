import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../additional/app_color.dart';
import '../additional/dimension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() arrowBackTapped;
  final String title;
  final String subtitle;
  final Color? statusBarColor, backgroundColor;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? height;
  final Widget? flexibleSpace;
  final Color titleColor;
  final FontWeight? titlefontWeight;
  final double? titlefontSize;
  final String? titlefontFamily;
  final Color? iconColor;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.subtitle = "",
    required this.arrowBackTapped,
    // this.statusBarColor = const Color(0x00000000),
    // this.backgroundColor = const Color(0xFFFFFFFF),
    this.statusBarColor,
    this.backgroundColor = null,
    this.titlefontWeight,
    this.bottom,
    this.actions,
    this.height,
    this.titlefontSize,
    this.titlefontFamily,
    this.iconColor,
    required this.titleColor,
    this.flexibleSpace,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: statusBarColor),
      backgroundColor: backgroundColor ?? Theme.of(context).canvasColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Visibility(
              visible: StringUtils.isNotNullOrEmpty(subtitle),
              child: Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12
                ),
              )
          )
        ],
      ),
      titleTextStyle: TextStyle(color: titleColor, fontSize: titlefontSize != null ? titlefontSize : Dimension.size24, fontWeight: titlefontWeight !=null ? titlefontWeight :  FontWeight.w700, fontFamily: titlefontFamily !=null ? titlefontFamily : 'Asap'),
      leading: IconButton(onPressed: arrowBackTapped, icon: const Icon(Icons.arrow_back)),
      iconTheme: IconThemeData(color: iconColor != null ? iconColor : Colors.white),
      bottom: bottom,
      titleSpacing: 0,
      elevation: 0,
      actions: actions,
      flexibleSpace: flexibleSpace,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../additional/dimension.dart';

class CustomAppBarWithSecondTitle extends StatelessWidget implements PreferredSizeWidget{
  final Function() arrowBackTapped;
  final String title;
  final String title2;
  final Color? statusBarColor, backgroundColor;
  final List<Widget>? actions;

  const CustomAppBarWithSecondTitle({
    Key? key,
    required this.title,
    required this.title2,
    required this.arrowBackTapped,
    // this.statusBarColor = const Color(0x00000000),
    // this.backgroundColor = const Color(0xFFFFFFFF),
    this.statusBarColor,
    this.backgroundColor = null,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: statusBarColor),
      backgroundColor: backgroundColor ?? Theme.of(context).canvasColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 3,),
          Text(title2, style: TextStyle(fontSize: 14),)
        ],
      ),
      titleTextStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.red, fontSize: Dimension.size24, fontWeight: FontWeight.w700, fontFamily: 'Asap'),
      leading: IconButton(onPressed: arrowBackTapped, icon: const Icon(Icons.arrow_back)),
      iconTheme: IconThemeData(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFFFFFFF) : Color(0xFF323232)),
      titleSpacing: 0,
      elevation: 0,
      actions: actions,
    );
  }
}
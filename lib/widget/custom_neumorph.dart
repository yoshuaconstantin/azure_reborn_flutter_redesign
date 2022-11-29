import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeu{

  Widget StdCustomSizeNormal(
      double? width ,
      double? height,
      Color lightColor,
      Color shadowColor,
      Color bgColor,
      double borderRadius,
      Widget widget
      ){
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -1,
          intensity: 2,
          surfaceIntensity: 0.5,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(borderRadius)),
          lightSource: LightSource.topLeft,
          shadowLightColor: lightColor,
          shadowDarkColor: shadowColor,
          color: bgColor,
        ),
        child: widget,
      ),
    );

}

}
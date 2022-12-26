import 'package:flutter/material.dart';

import '../additional/dimension.dart';

class TextSheet extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final double opacity;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  final double? letterSpacing;
  final double? lineHeight;
  final FontStyle? fontStyle;


  const TextSheet({
    Key? key,
    required this.text,
    this.color,
    this.size = 0,
    this.fontWeight = FontWeight.w700,
    this.textAlign,
    this.opacity = 1,
    this.overflow,
    this.maxLines,
    this.fontFamily,
    this.letterSpacing,
    this.lineHeight,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color?.withOpacity(opacity),
        fontSize: size == 0 ? Dimension.size24 : size,
        fontWeight: fontWeight,
        overflow: overflow,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: lineHeight,
        fontStyle: fontStyle
      ),
      maxLines: maxLines,
    );
  }
}

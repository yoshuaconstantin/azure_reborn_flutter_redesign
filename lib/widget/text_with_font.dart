import 'package:flutter/cupertino.dart';

class textWithFont extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  Color color;
  double wordSpacing;
  TextAlign? alignment;

  textWithFont({Key? key, required this.text, this.fontSize = 13, this.fontFamily, this.fontWeight, required this.color, this.wordSpacing = 1, this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        wordSpacing: wordSpacing,
        ),
        textAlign: alignment ?? TextAlign.start,
    );
  }
}

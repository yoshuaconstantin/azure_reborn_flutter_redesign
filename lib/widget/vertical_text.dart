import 'package:flutter/cupertino.dart';

class MyVerticalText extends StatelessWidget {
  final String text;

  const MyVerticalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text.split("").map((string) => Text(string, style: TextStyle(fontSize: 14), textAlign: TextAlign.center,)).toList(),
    );
  }
}

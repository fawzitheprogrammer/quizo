import 'package:flutter/material.dart';

Widget headlineLarge(String text, double fontSize, Color fontColor) {
  return Text(
    text,
    style:
        TextStyle(color: fontColor, fontSize: fontSize, fontFamily: 'NRT Bold'),
  );
}

Widget bodyTextLight(String text, double fontSize, Color fontColor) {
  return Text(
    text,
    style:
        TextStyle(color: fontColor, fontSize: fontSize, fontFamily: 'NRT Reg'),
  );
}

Widget bodyTextMedium(String text, double fontSize, Color fontColor) {
  return Text(
    text,
    style:
        TextStyle(color: fontColor, fontSize: fontSize, fontFamily: 'NRT Bold'),
    textAlign: TextAlign.right,
  );
}

Widget buttonTextMedium(String text, double fontSize, Color fontColor) {
  return Text(
    text,
    style:
        TextStyle(color: fontColor, fontSize: fontSize, fontFamily: 'NRT Reg'),
  );
}

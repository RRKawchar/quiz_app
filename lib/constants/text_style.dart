import 'package:flutter/material.dart';

Widget normalText(
{
  required String text,
  Color? color,
  double? fontSize,
}
    ){
  return  Text(
    text,
    style: TextStyle(
        fontSize: fontSize, fontFamily: 'quick_semi', color: color),
  );
}

Widget headingText(
    {
      required String text,
      Color? color,
      double? fontSize,
    }
    ){
  return  Text(
    text,
    style: TextStyle(
        fontSize: fontSize, fontFamily: 'quick_bold', color: color),
  );
}
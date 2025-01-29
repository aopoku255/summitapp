import 'dart:ffi';

import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  const MainText({super.key, required this.text,  this.fontWeight, this.fontSize, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize));
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFontWidget extends StatelessWidget {
  String text;
  double fontsize;
  FontWeight? fontWeight;
  double? letterSpacing;
  Color? color;
  TextOverflow? overflow;
  TextFontWidget({
    required this.text,
    required this.fontsize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.overflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
     // maxLines: 1,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

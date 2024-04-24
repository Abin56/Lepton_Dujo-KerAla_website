import 'package:flutter/material.dart';

class TextFontWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final Color? color;
  final TextOverflow? overflow;
 final String? Function(String?)? validator;
   const TextFontWidget({
    this.validator,
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
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: Colors.black,
      ),
    );
  }
}



class TextFontWidgetRouter extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final Color? color;
  final TextOverflow? overflow;
  const TextFontWidgetRouter({
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
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: Colors.white,
      ),
    );
  }
}

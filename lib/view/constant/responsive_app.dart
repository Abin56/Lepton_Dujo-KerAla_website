import 'package:flutter/material.dart';

class ResponsiveApp {
  static late MediaQueryData _mediaQueryData;

  static MediaQueryData get mq => _mediaQueryData;
  static Size get size => _mediaQueryData.size;
  static double get width => _mediaQueryData.size.width;
  static double get height => _mediaQueryData.size.height;
  static void serMq(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }
}

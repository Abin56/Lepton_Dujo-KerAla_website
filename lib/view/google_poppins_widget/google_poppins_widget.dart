// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GooglePoppinsWidgets extends StatelessWidget {
  String text;
  double fontsize;
  FontWeight? fontWeight;
  Color? color;
  VoidCallback? onTap;
  TextOverflow? overflow;
  int? maxLines;
   GooglePoppinsWidgets({
    required this.text,
    required this.fontsize,
    this.fontWeight,
    this.color,
    this.onTap,
    this.overflow,
    this.maxLines,
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      style: GoogleFonts.poppins(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
   
     
        
        
      ),
    );
  }
}
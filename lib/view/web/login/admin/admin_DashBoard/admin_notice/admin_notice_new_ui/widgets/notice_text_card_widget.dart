import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeTextWidget extends StatelessWidget {
  const NoticeTextWidget(
      {super.key,
      required this.title,
      this.fontSize = 15,
      this.color = Colors.black});
  final String title;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Text(
        title,
        style: GoogleFonts.sansita(
          fontSize: fontSize,
          color: color,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

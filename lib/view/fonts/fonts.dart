import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

TextStyle ralewayStyle = GoogleFonts.raleway();

class GoogleFont {
  static final TextStyle style = GoogleFonts.montserrat(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: cWhite,
  );

  static final TextStyle headTextStyleMont = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: cWhite,
  );
  static final TextStyle headTextStyle = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle otpTextStyle = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle subHeadTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: cWhite,
  );
  static final TextStyle miniHeadTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: cWhite,
  );
  static final TextStyle forgotpasswordTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  // static final TextStyle textButtonStyle = GoogleFonts.poppins(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w500,
  //   color: appMainColor,
  //   decoration: TextDecoration.underline,
  // );
  static final TextStyle normalHeadTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: cBlack,
  );
   static final TextStyle headTextStyleBold = GoogleFonts.montserrat(
     fontSize: 30,
    color: cWhite,
    fontWeight: FontWeight.bold,
  );
     static final TextStyle miniHeadTextStyleBold = GoogleFonts.poppins(
    fontSize: 30,
    color: cBlack,
    fontWeight: FontWeight.w700,
  );
    static final TextStyle subHeadTextStyleBlack = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: cBlack,
  );
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff303030);
  static const Color navy = Color(0xff4F5A69);
  static const Color red = Color(0xffC91C22);
  static const Color darkBlue = Color(0xff003E90);
  static const Color lightBlue = Color(0xff4882CF);
  static const Color pink = Color(0xffED1E79);
  static const Color brown = Color(0xffCF7E48);
  static const Color yellow = Color(0xffF2D352);
  static const Color darkTeal = Color(0xff42505C);
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.exo(
          color: white, fontSize: 22, fontWeight: FontWeight.w400),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(32),
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      foregroundColor: white,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: navy,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.exo(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: white
      ),
      headlineSmall: GoogleFonts.poppins(
        color: black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.poppins(
        color: darkTeal,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}

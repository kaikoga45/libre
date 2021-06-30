import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  accentColor: Color(0xFF0B0D14),
  buttonColor: Color(0xFF0B0D14),
  textTheme: TextTheme(
    headline1: GoogleFonts.amiri(
      fontSize: 119,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Color(0xFF0B0D14),
    ),
    headline2: GoogleFonts.amiri(
      fontSize: 75,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Color(0xFF0B0D14),
    ),
    headline3: GoogleFonts.amiri(
      fontSize: 60,
      fontWeight: FontWeight.w400,
      color: Color(0xFF0B0D14),
    ),
    headline4: GoogleFonts.amiri(
      fontSize: 42,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Color(0xFF0B0D14),
    ),
    headline5: GoogleFonts.amiri(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Color(0xFF0B0D14),
    ),
    headline6: GoogleFonts.amiri(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Color(0xFF0B0D14),
    ),
    subtitle1: GoogleFonts.amiri(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: Color(0xFF0B0D14),
    ),
    subtitle2: GoogleFonts.amiri(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Color(0xFF0B0D14),
    ),
    bodyText1: GoogleFonts.amiri(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Color(0xFF4f4f4f),
    ),
    bodyText2: GoogleFonts.amiri(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Color(0xFF4f4f4f),
    ),
    button: GoogleFonts.amiri(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: Colors.white,
    ),
    caption: GoogleFonts.amiri(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Color(0xFF4f4f4f),
    ),
    overline: GoogleFonts.amiri(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: Color(0xFF4f4f4f),
    ),
  ),
);

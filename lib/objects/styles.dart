import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color appbar = Color.fromARGB(255, 208, 53, 42);
  static const Color settings = Color.fromARGB(255, 119, 119, 119);
}

class Dimensions {
  static const double pMargin = 16.0;
  static const double rMargin = 12.0;

  static get pPadding => const EdgeInsets.all(pMargin);
  static get rPadding => const EdgeInsets.all(rMargin);
  static get wPadding => const EdgeInsets.fromLTRB(20, 50, 20, 10);
}

final settingsText = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 21.0,
  letterSpacing: -0.7,
);

final welcomeText = GoogleFonts.abel(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);

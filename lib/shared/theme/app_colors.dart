import 'package:flutter/material.dart';

class AppColors {
  // Red/Teal Theme Colors
  static Color get darkRed => Color(0xFF950606);
  static Color get teal => Color(0xFF069494);
  static Color get gold => Color(0xFFEFBF04);
  static Color get ivory => Color(0xFFFFFFE3);

  // Red/Teal Gradient Colors
  static Gradient redTealGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [darkRed, teal],
    stops: [0.0, 0.5],
  );

  // Blue/Cyan Theme Colors
  static Color get darkBlue => Color(0xFF210cae);
  static Color get softCyan => Color(0xFF4dc9e6);
  static Color get cream => Color(0xFFFDFBD4);
  static Color get warmBeige => Color(0xFFf4e2d8);

  // Blue/Cyan Gradient Colors
  static Gradient blueCyanGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [darkBlue, softCyan],
    stops: [0.0, 0.5],
  );

  static Color get paleBlue => Color(0xFFCAD0FF);
  static Color get lightGray => Color(0xFFE3E3E3);
  static Color get goldenYellow => Color(0xFFFFE0B3);
  static Color get deepBrown => Color(0xFF8B4C39);

  static Gradient blueGrayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [paleBlue, lightGray],
    stops: [0.0, 0.5],
  );
}

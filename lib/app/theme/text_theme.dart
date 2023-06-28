import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static defaultStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return GoogleFonts.urbanist(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis));
  }
}

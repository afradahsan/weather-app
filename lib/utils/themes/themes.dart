import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/themes/text_theme.dart';
import 'package:weather_app/utils/themes/textfield_theme.dart';

class KAppTheme{
  KAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.montserrat.toString(),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textTheme: KTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(11, 12, 30, 1),
    fontFamily: GoogleFonts.montserrat().toString(),
    primaryColor: Colors.blue,
    textTheme: KTextTheme.darkTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
  );
}
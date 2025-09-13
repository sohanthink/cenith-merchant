import 'package:flutter/material.dart';

class AppColors{

  static final Color _themColor = const Color(0xFF0082E0);
  static final Color _darkBlue = const Color(0xFF141D3F);
  static final Color _midLightBlue = const Color(0xFF40A1E8);
  static final Color _lightBlue = const Color(0xFFBFE0F7);
  static final Color _scaffoldColor = const Color(0xFFF4F4F7);
  static final Color _greenShade = const Color(0xFF37F222);
  static final Color _black = const Color(0xFFE8E7EC);

  static MaterialColor themColor = getMaterialColor(_themColor);
  static MaterialColor darkBlue = getMaterialColor(_darkBlue);
  static MaterialColor midLightBlue = getMaterialColor(_midLightBlue);
  static MaterialColor lightBlue = getMaterialColor(_lightBlue);
  static MaterialColor greenShade = getMaterialColor(_greenShade);
  static get scaffoldColor => _scaffoldColor;
  static get black12 => _black;



  static MaterialColor getMaterialColor (Color color){
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    } ;

    return MaterialColor(color.value, shades);
  }

}
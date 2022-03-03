import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//blue design
Color _primaryColor = const Color(0xff0b4874);
Color _accentLight = const Color(0xfff2f9fa); // should be lighter than accentBlueLight
Color _accentDark = const Color(0xff5f7a8e);
//Color _accentBlueLight = const Color(0xff81a4bd);

final ThemeData lightTheme = ThemeData(
  primaryColor: _primaryColor,
  colorScheme: ColorScheme.light(
    primary: _primaryColor,
    secondary: _accentLight,
    onBackground: _accentDark,

    //outline: accentBlueLight,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 20, color: Colors.white),
    headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: _primaryColor,
    ),
    foregroundColor: _primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        _primaryColor,
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          color: _accentLight,
        ),
      ),
    ),
  ),
);

//ThemeData darkTheme = ThemeData.dark();
final ThemeData darkTheme = lightTheme;

/*
//pink design
Color primaryColor = const Color(0xffe491b7);
Color accentLight = const Color(0xfff2f9fa); // should be lighter than accentBlueLight
Color accentDark = const Color(0xff0b4874);
Color accentBlueLight = const Color(0xff81a4bd);
*/
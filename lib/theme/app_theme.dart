import 'package:flutter/material.dart';

const primary = Color(0xffFFC736);
const secondary = Color(0xffFFE247);
const sucess = Color(0xff5EF417);
const danger = Color(0xffFF2525);
const neutral = Color(0xffF57070);
const border = Color(0xffA1A1A1);
const titleBackground = Color(0xff141D3A);
const defaultTextColor = Colors.black;

TextStyle titleText({Color color = Colors.black}) => TextStyle(
    fontFamily: "Dongle",
    fontWeight: FontWeight.bold,
    fontSize: 36,
    height: 0.5,
    color: color);
TextStyle headTextBold({Color color = defaultTextColor}) => TextStyle(
    fontFamily: "Dongle",
    fontWeight: FontWeight.bold,
    fontSize: 32,
    height: 0.5,
    color: color);
TextStyle headText({Color color = defaultTextColor}) => TextStyle(
    fontFamily: "Dongle",
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 0.5,
    color: color);
TextStyle regularTextBold({Color color = defaultTextColor}) => TextStyle(
    fontFamily: "Dongle",
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 0.5,
    color: color);
TextStyle regularText({Color color = defaultTextColor}) => TextStyle(
    fontFamily: "Dongle",
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 0.5,
    color: color);

ThemeData themedata = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    secondary: secondary,
    onSecondary: Colors.white,
    error: danger,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: defaultTextColor),
    displayMedium: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: defaultTextColor),
    displaySmall: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: defaultTextColor),
    bodyMedium: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: defaultTextColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: titleBackground,
    elevation: 0,
    shadowColor: Colors.white,
    foregroundColor: Colors.white,
    iconTheme:
        IconThemeData(weight: 900, size: 34, grade: 900, color: Colors.white),
    titleTextStyle: TextStyle(
        fontFamily: 'Dongle',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: Colors.white),
  ),
);

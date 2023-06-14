import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const primary = Color(0xffFFC736);
const secondary = Color(0xffFFE247);
const sucess = Color(0xff5EF417);
const danger = Color(0xffFF2525);
const neutral = Color(0xffF57070);
const lonely = Color(0xff848484);
const border = Color(0xffA1A1A1);
const titleBackground = Color(0xff141D3A);
const defaultTextColor = Colors.black;

const defaultHeight = 1.0;

Icon bahtIconRegularText({Color color = defaultTextColor, double? size = 17}) =>
    Icon(
      FontAwesomeIcons.bahtSign,
      color: defaultTextColor,
      size: size,
    );
TextStyle titleText(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w700,
        fontSize: 36,
        height: height,
        color: color);
TextStyle headTextBold(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: height,
        color: color);
TextStyle headText(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w400,
        fontSize: 32,
        height: height,
        color: color);
TextStyle formFieldText(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w300,
        fontSize: 32,
        height: height,
        color: color);
TextStyle regularTextBold(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: height,
        color: color);
TextStyle regularText(
        {Color color = defaultTextColor, double? height = defaultHeight}) =>
    TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w300,
        fontSize: 24,
        height: height,
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
        height: defaultHeight,
        color: defaultTextColor),
    displayMedium: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: defaultHeight,
        color: defaultTextColor),
    displaySmall: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: defaultHeight,
        color: defaultTextColor),
    bodyMedium: TextStyle(
        fontFamily: "Dongle",
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: defaultHeight,
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
        height: defaultHeight,
        color: Colors.white),
  ),
);

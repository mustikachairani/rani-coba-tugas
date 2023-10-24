import 'package:flutter/material.dart';

final Brightness brightness = Brightness
    .light; // Anda dapat mengganti dengan Brightness.dark jika Anda menginginkan tema gelap.
final Color primaryColor = Colors.green; // Primary color menjadi biru
final Color onPrimary = Colors.white; // Text on primary color menjadi putih
final Color secondaryColor = Colors.yellow; // Secondary color menjadi kuning
final Color onSecondary = Colors.black; // Text on secondary color menjadi hitam
final Color errorColor = Colors.red; // Error color menjadi merah
final Color onError = Colors.white; // Text on error color menjadi putih
final Color backgroundColor = Colors.white; // Background color menjadi putih
final Color onBackgroundColor =
    Colors.black; // Text on background color menjadi hitam
final Color surfaceColor =
    Colors.grey; // Surface color (misalnya card) menjadi warna abu-abu
final Color onSurfaceColor =
    Colors.black; // Text on surface color menjadi hitam

final ThemeData appTheme = ThemeData(
  fontFamily: 'Fuggles',
  colorScheme: ColorScheme(
    brightness: brightness,
    primary: primaryColor,
    onPrimary: onPrimary,
    secondary: secondaryColor,
    onSecondary: onSecondary,
    error: errorColor,
    onError: onError,
    background: backgroundColor,
    onBackground: onBackgroundColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
  ),
);
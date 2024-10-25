import 'package:flutter/material.dart';
import 'package:todo/style/AppColors.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      primary: AppColors.lightPrimary,

    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
      )
    ),
    useMaterial3: true,
  );
}
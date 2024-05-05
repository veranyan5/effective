import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.basicBlack,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'sfpro'),
    ),
  );
}

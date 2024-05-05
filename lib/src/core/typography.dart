import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static final TextStyle heading22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle body16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle body14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle body10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16.0,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
  
}

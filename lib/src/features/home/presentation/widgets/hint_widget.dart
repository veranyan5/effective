import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';

class HintWidget extends StatelessWidget {
  const HintWidget({super.key, required this.color, required this.imagePath, required this.text,required this.onTap});
  final String imagePath;
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.w),
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: AppTypography.body14.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

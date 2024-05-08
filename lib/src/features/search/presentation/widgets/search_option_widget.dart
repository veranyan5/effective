import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';

class SearchOptionWidget extends StatelessWidget {
  const SearchOptionWidget({
    super.key,
    this.iconPath = '',
    required this.text,
    this.iconColor = AppColors.basicGray7,
    this.color = AppColors.basicGray3,
    this.verticalPadding = 8,
    this.horizotalPadding = 12,
  });
  final String iconPath;
  final String text;
  final Color iconColor;
  final Color color;
  final int verticalPadding;
  final int horizotalPadding;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding.h, horizontal: horizotalPadding.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconPath.isNotEmpty)
              Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 8.w),
                ],
              ),
            TextWidget(
              text: text,
              style: AppTypography.body14.copyWith(
                color: AppColors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

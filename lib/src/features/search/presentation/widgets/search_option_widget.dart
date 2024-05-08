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
  });
  final String iconPath;
  final String text;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.basicGray3,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: Row(
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/extensions/price_formatting_extension.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';

class FlightWidget extends StatelessWidget {
  const FlightWidget({
    super.key,
    required this.name,
    required this.iconColor,
    required this.price,
    required this.timeRange,
  });
  final String name;
  final Color iconColor;
  final int price;
  final List<String> timeRange;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: name,
                        style: AppTypography.body14.copyWith(
                          color: AppColors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Spacer(),
                      TextWidget(
                        text: '${price.formatPrice()} ₽',
                        style: AppTypography.body14.copyWith(
                          color: AppColors.specialBlue,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SvgPicture.asset('assets/svg/right_arrow_blue.svg'),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  TextWidget(
                    text: List<String>.from(timeRange).join('  '),
                    style: AppTypography.body14.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: AppColors.basicGray4,
          thickness: 1.sp,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';

class HomePageSearchWidget extends StatelessWidget {
  const HomePageSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.basicGray3,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: AppColors.basicGray4,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(width: 8.w),
            SvgPicture.asset(
              'assets/svg/search.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.basicBlack,
                BlendMode.srcIn,
              ),
              width: 24.w,
              height: 24.w,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(1),
                      hintText: 'Откуда - Москва',
                      hintStyle: AppTypography.body16.copyWith(color: AppColors.basicGray6),
                    ),
                    style: AppTypography.body16.copyWith(color: AppColors.white),
                  ),
                  Divider(
                    color: AppColors.basicGray5,
                    thickness: 1.sp,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(1),
                      hintText: 'Откуда - Москва',
                      hintStyle: AppTypography.body16.copyWith(color: AppColors.basicGray6),
                    ),
                    style: AppTypography.body16.copyWith(color: AppColors.white),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(borderSide: BorderSide.none),
                  //     contentPadding: EdgeInsets.all(0),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }
}

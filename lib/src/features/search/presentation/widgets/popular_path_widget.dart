import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_colors.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../../../../core/typography.dart';

class PopularPathWidget extends StatelessWidget {
  const PopularPathWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.searchBloc,
  });
  final String imagePath;
  final String name;
  final SearchBloc searchBloc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        searchBloc.add(SetDepartureValueEvent(departureValue: name));
        context
          ..pop()
          ..push('/search');
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.w,
                width: 40.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.body16.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    'Популярное направление',
                    style: AppTypography.body14.copyWith(color: AppColors.basicGray5),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColors.basicGray5,
            thickness: 1.sp,
          ),
        ],
      ),
    );
  }
}

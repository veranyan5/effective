import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'typography.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, this.fromNavigator = false});
  final bool fromNavigator;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Тут ничего нет :) ',
                style: AppTypography.heading22.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 8.h),
              if (fromNavigator)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

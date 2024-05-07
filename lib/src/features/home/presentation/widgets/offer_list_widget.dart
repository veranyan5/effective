// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/extensions/price_formatting_extension.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../data/models/offer_model.dart';

class OfferListWidget extends StatelessWidget {
  OfferListWidget({
    super.key,
    required this.offerList,
  });

  final List<String> imagePath = [
    'assets/png/fake_image1.png',
    'assets/png/fake_image2.png',
    'assets/png/fake_image3.png',
  ];

  final List<Offer> offerList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath[index],
                  height: 133.w,
                ),
              ),
              SizedBox(height: 8.h),
              TextWidget(
                text: '${offerList[index].title}',
                style: AppTypography.body16.copyWith(color: AppColors.white),
                align: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              TextWidget(
                text: '${offerList[index].town}',
                style: AppTypography.body14.copyWith(color: AppColors.white),
                align: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/small_plane.svg',
                    width: 24.w,
                    height: 24.w,
                  ),
                  TextWidget(
                    text: 'От ${offerList[index].price?.value!.formatPrice()} ₽ ',
                    style: AppTypography.body14.copyWith(color: AppColors.white),
                    align: TextAlign.center,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

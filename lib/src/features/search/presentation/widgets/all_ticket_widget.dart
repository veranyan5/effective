import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/extensions/price_formatting_extension.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../data/models/ticket_model.dart';
import '../bloc/all_tickets_bloc/all_tickets_bloc.dart';
import 'search_option_widget.dart';

class AllTicketWidget extends StatelessWidget {
  const AllTicketWidget({
    super.key,
    required this.price,
    required this.arrivalDateTime,
    required this.departureDateTime,
    required this.arrivalName,
    required this.departureName,
    required this.allTicketsBloc,
    required this.badge,
    required this.hasTransfer,
  });
  final int price;
  final DateTime arrivalDateTime;
  final DateTime departureDateTime;
  final Airport arrivalName;
  final Airport departureName;
  final AllTicketsBloc allTicketsBloc;
  final String? badge;
  final bool hasTransfer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.maxFinite,
              height: 155,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.basicGray1,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: badge != null && badge!.isNotEmpty ? 16.h : 8.h,
                    horizontal: 12.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      TextWidget(
                        text: '${price.formatPrice()} ₽ ',
                        style: AppTypography.heading22.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.specialRed,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: DateFormat.Hm().format(departureDateTime),
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextWidget(
                                text: departureName.name,
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.basicGray6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: ' –	',
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.basicGray6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextWidget(
                                text: ' ',
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.basicGray6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: DateFormat.Hm().format(arrivalDateTime),
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextWidget(
                                text: arrivalName.name,
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.basicGray6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    text:
                                        '${allTicketsBloc.differenceInHours(arrivalDateTime, departureDateTime)} в пути',
                                    style: AppTypography.body14.copyWith(
                                      color: AppColors.white,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    maxLines: 2,
                                  ),
                                  if (hasTransfer)
                                    TextWidget(
                                      text: ' / Без пересадок',
                                      style: AppTypography.body14.copyWith(
                                        color: AppColors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              TextWidget(
                                text: '',
                                style: AppTypography.body14.copyWith(
                                  color: AppColors.basicGray6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (badge != null && badge!.isNotEmpty)
            SearchOptionWidget(
              verticalPadding: 2,
              horizotalPadding: 10,
              text: badge!,
              color: AppColors.specialBlue,
            ),
        ],
      ),
    );
  }
}

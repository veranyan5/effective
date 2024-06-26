import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/extensions/russian_text_regexp.dart';
import '../../../../core/typography.dart';
import '../../../search/presentation/bloc/search_bloc/search_bloc.dart';
import 'search_bottom_sheet.dart';

class HomePageSearchWidget extends StatelessWidget {
  const HomePageSearchWidget({
    super.key,
    required this.searchBloc,
    required this.iconPath,
    this.haveSuffix = false,
    required this.iconColor,
    this.departureReadOnly = true,
    this.openBottomSheet = true,
    this.shouldPop = false,
  });
  final SearchBloc searchBloc;
  final String iconPath;
  final bool haveSuffix;
  final bool openBottomSheet;
  final bool departureReadOnly;
  final Color iconColor;
  final bool shouldPop;
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
            GestureDetector(
              onTap: () {
                if (shouldPop) {
                  Navigator.pop(context);
                }
              },
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
                width: 24.w,
                height: 24.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(cyrillicRegExp)],
                          controller: searchBloc.arrivalTextController,
                          onChanged: (value) {
                            GetIt.I.get<Talker>().log(value);
                            searchBloc
                              ..add(SearchEvent(searchValue: value))
                              ..add(SaveValueToStorageEvent(value: value));
                          },
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
                      ),
                      if (haveSuffix)
                        GestureDetector(
                          onTap: () {
                            searchBloc.add(SwapControllersEvent());
                          },
                          child: SvgPicture.asset(
                            'assets/svg/change.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                    ],
                  ),
                  Divider(
                    color: AppColors.basicGray5,
                    thickness: 1.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [FilteringTextInputFormatter.allow(cyrillicRegExp)],
                          controller: searchBloc.departureTextController,
                          readOnly: departureReadOnly,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(1),
                            hintText: 'Куда - Турция',
                            hintStyle: AppTypography.body16.copyWith(color: AppColors.basicGray6),
                          ),
                          onTap: () {
                            if (openBottomSheet) {
                              searchBloc.state.arrivalText.isNotEmpty
                                  ? showModalBottomSheet<Padding>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom,
                                          ),
                                          child: Wrap(
                                            children: [
                                              SearchBottomSheet(
                                                searchBloc: searchBloc,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : HapticFeedback.heavyImpact();
                            }
                          },
                          style: AppTypography.body16.copyWith(color: AppColors.white),
                        ),
                      ),
                      if (haveSuffix)
                        GestureDetector(
                          onTap: () {
                            searchBloc.add(ClearDepartureValueEvent());
                          },
                          child: SvgPicture.asset(
                            'assets/svg/close.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                    ],
                  ),
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

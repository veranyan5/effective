import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/extensions/russian_text_regexp.dart';
import '../../../search/presentation/bloc/search_bloc.dart';
import '../../../../core/typography.dart';

class SearchWidgetBottomSheet extends StatelessWidget {
  const SearchWidgetBottomSheet({
    super.key,
    required this.searchBloc,
  });

  final SearchBloc searchBloc;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.basicGray3,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/plane.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    bloc: searchBloc,
                    builder: (context, state) {
                      return TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.allow(cyrillicRegExp)],
                        controller: searchBloc.arrivalTextController,
                        style: AppTypography.body16.copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Куда - Турция',
                          hintStyle: AppTypography.body16.copyWith(color: AppColors.basicGray6),
                        ),
                      );
                    },
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
                SvgPicture.asset(
                  'assets/svg/search.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(cyrillicRegExp)],
                    style: AppTypography.body16.copyWith(color: AppColors.white),
                    controller: searchBloc.departureTextController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Куда - Турция',
                      hintStyle: AppTypography.body16.copyWith(color: AppColors.basicGray6),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/svg/close.svg', width: 24.w, height: 24.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/placeholder_screen.dart';
import '../../../search/presentation/bloc/search_bloc/search_bloc.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../search/presentation/widgets/popular_path_widget.dart';
import '../bloc/home_bloc.dart';
import 'hint_widget.dart';
import 'search_widget_bottom_sheet.dart';

class SearchBottomSheet extends StatelessWidget {
  SearchBottomSheet({
    super.key,
    required this.searchBloc,
  });
  final HomeBloc homeBloc = GetIt.I.get<HomeBloc>();
  final SearchBloc searchBloc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.basicGray2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.basicGray5,
                  ),
                  child: SizedBox(width: 38.w, height: 5.h),
                ),
                SizedBox(height: 24.h),
                SearchWidgetBottomSheet(searchBloc: searchBloc),
                SizedBox(height: 24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HintWidget(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: const PlaceholderScreen(
                            fromNavigator: true,
                          ),
                        );
                      },
                      color: AppColors.specialGreen,
                      imagePath: 'assets/svg/path.svg',
                      text: 'Сложный\nмаршрут',
                    ),
                    HintWidget(
                      onTap: () {
                        searchBloc.add(
                          SetDepartureValueEvent(departureValue: 'Куда угодно'),
                        );
                        Navigator.pop(context);
                        pushNewScreen(
                          context,
                          screen: const SearchPage(),
                        );
                      },
                      color: AppColors.specialBlue,
                      imagePath: 'assets/svg/ball.svg',
                      text: 'Куда угодно',
                    ),
                    HintWidget(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: const PlaceholderScreen(
                            fromNavigator: true,
                          ),
                        );
                      },
                      color: AppColors.specialDarkBlue,
                      imagePath: 'assets/svg/calendar.svg',
                      text: 'Выходные',
                    ),
                    HintWidget(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: const PlaceholderScreen(
                            fromNavigator: true,
                          ),
                        );
                      },
                      color: AppColors.specialRed,
                      imagePath: 'assets/svg/fire.svg',
                      text: 'Горячие\nбилеты',
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.basicGray3,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                    child: Column(
                      children: [
                        PopularPathWidget(
                          imagePath: 'assets/png/istanbul.png',
                          name: 'Стамбул',
                          searchBloc: searchBloc,
                        ),
                        PopularPathWidget(
                          imagePath: 'assets/png/sochi.jpg',
                          name: 'Сочи',
                          searchBloc: searchBloc,
                        ),
                        PopularPathWidget(
                          imagePath: 'assets/png/phuket.png',
                          name: 'Пхукет',
                          searchBloc: searchBloc,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 150.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

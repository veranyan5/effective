import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../core/app_colors.dart';
import '../../../home/presentation/widgets/home_page_search_widget.dart';
import '../bloc/search_bloc.dart';
import '../widgets/search_option_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchBloc searchBloc;
  @override
  void initState() {
    searchBloc = context.read<SearchBloc>();
    searchBloc.add(InitCurrentDateTimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.w),
        child: Column(
          children: [
            HomePageSearchWidget(
              searchBloc: searchBloc,
              iconPath: 'assets/svg/back.svg',
              haveSuffix: true,
              iconColor: AppColors.white,
              departureReadOnly: false,
              openBottomSheet: false,
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 33.h,
              child: BlocBuilder<SearchBloc, SearchInitial>(
                builder: (context, state) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(),
                            dialogSize: Size(300.w, 300.h),
                          ).then((value) {
                            if (value != null) {
                              searchBloc
                                  .add(PickDepartureDateTimeEvent(departureDateTime: value.first!));
                            }
                          });
                        },
                        child: SearchOptionWidget(
                          text: state.departureDateTime != null
                              ? searchBloc.formatDateTime(state.departureDateTime!)
                              : 'Обратно',
                          iconPath: state.departureDateTime != null ? '' : 'assets/svg/plus.svg',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(),
                            dialogSize: Size(300.w, 300.h),
                          ).then((value) {
                            if (value != null) {
                              searchBloc
                                  .add(PickArrivalDateTimeEvent(arrivalDateTime: value.first!));
                            }
                          });
                        },
                        child: SearchOptionWidget(
                          text: searchBloc.formatDateTime(state.arrivalDateTime ?? DateTime.now()),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const SearchOptionWidget(
                        text: '1, эконом',
                        iconPath: 'assets/svg/human.svg',
                      ),
                      SizedBox(width: 8.w),
                      const SearchOptionWidget(
                        text: 'Фильтр',
                        iconPath: 'assets/svg/filter.svg',
                      ),
                      SizedBox(width: 8.w),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

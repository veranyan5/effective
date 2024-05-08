import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../home/presentation/widgets/home_page_search_widget.dart';
import '../bloc/flight_bloc/flight_bloc.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/flight_widget.dart';
import '../widgets/search_option_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchBloc searchBloc;
  late final FlightBloc flightBloc;
  @override
  void initState() {
    searchBloc = context.read<SearchBloc>();
    flightBloc = context.read<FlightBloc>();
    searchBloc.add(InitCurrentDateTimeEvent());
    flightBloc.add(GetTicketOffersEvent());
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
              shouldPop: true,
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
            SizedBox(height: 12.h),
            BlocBuilder<FlightBloc, FlightState>(
              bloc: flightBloc,
              builder: (context, state) {
                switch (state) {
                  case (FlightLoadingState()):
                    {
                      return const CircularProgressIndicator();
                    }
                  case (FlightLoadedState()):
                    {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.basicGray1,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Прямые рейсы',
                                style: AppTypography.heading20.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Column(
                                children: List.generate(
                                  state.ticketOffers!.length,
                                  (index) => FlightWidget(
                                    name: state.ticketOffers?[index].title ?? '',
                                    iconColor: index != 0
                                        ? index == 1
                                            ? AppColors.specialBlue
                                            : AppColors.white
                                        : AppColors.specialRed,
                                    price: state.ticketOffers?[index].price?.value ?? 1000,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              GestureDetector(
                                onTap: () {
                                  context.push('/tickets');
                                },
                                child: Center(
                                  child: TextWidget(
                                    text: 'Показать все',
                                    style: AppTypography.body16.copyWith(
                                      color: AppColors.specialBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  default:
                    return const SizedBox();
                }
              },
            ),
            SizedBox(height: 24.h),
            AppButton(
              onTap: () {
                context.push('/tickets');
              },
              color: AppColors.specialBlue,
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.5.h),
                  child: TextWidget(
                    text: 'Посмотреть все билеты',
                    style: AppTypography.body16.copyWith(
                      color: AppColors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            AppButton(
              onTap: () {},
              color: AppColors.basicGray2,
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bell.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
                      ),
                      SizedBox(width: 8.w),
                      TextWidget(
                        text: 'Посмотреть все билеты',
                        style: AppTypography.body16.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        align: TextAlign.center,
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          activeColor: AppColors.specialBlue,
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

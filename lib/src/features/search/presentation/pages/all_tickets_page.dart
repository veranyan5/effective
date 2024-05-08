import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/all_tickets_bloc/all_tickets_bloc.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/all_ticket_widget.dart';

class AllTicketsPage extends StatefulWidget {
  const AllTicketsPage({super.key});

  @override
  State<AllTicketsPage> createState() => _AllTicketsPageState();
}

class _AllTicketsPageState extends State<AllTicketsPage> {
  late final SearchBloc searchBloc;
  late final AllTicketsBloc allTicketsBloc;
  @override
  void initState() {
    searchBloc = context.read<SearchBloc>();
    allTicketsBloc = context.read<AllTicketsBloc>();
    allTicketsBloc.add(GetTicketsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 64.h,
            ),
            child: Column(
              children: [
                BlocBuilder<SearchBloc, SearchInitial>(
                  builder: (context, state) {
                    return DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.basicGray2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                'assets/svg/back.svg',
                                width: 24.w,
                                height: 24.h,
                                colorFilter:
                                    const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: '${state.arrivalText} - ${state.departureText}',
                                  style: AppTypography.body16.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                TextWidget(
                                  text: state.departureDateTime == null
                                      ? '${searchBloc.formatFullDateTime(state.arrivalDateTime!)}, 1 пассажир'
                                      : '${searchBloc.formatFullDateTime(state.arrivalDateTime!)} - ${searchBloc.formatFullDateTime(state.departureDateTime!)} , 1 пассажир',
                                  style: AppTypography.body14.copyWith(
                                    color: AppColors.basicGray6,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                BlocBuilder<AllTicketsBloc, AllTicketsState>(
                  builder: (context, state) {
                    if (state is TicketsLoadedState) {
                      return Expanded(
                        child: SizedBox(
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 16.h, bottom: 64.h),
                            separatorBuilder: (context, index) => SizedBox(height: 16.h),
                            itemCount: state.tickets?.length ?? 0,
                            itemBuilder: (context, index) {
                              final ticket = state.tickets![index];
                              return AllTicketWidget(
                                allTicketsBloc: allTicketsBloc,
                                badge: ticket.badge,
                                arrivalDateTime: ticket.arrival!.date!,
                                departureDateTime: ticket.departure!.date!,
                                price: ticket.price?.value ?? 0,
                                arrivalName: ticket.arrival!.airport!,
                                departureName: ticket.departure!.airport!,
                                hasTransfer: ticket.hasTransfer!,
                              );
                            },
                          ),
                        ),
                      );
                    } else if (state is TicketsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // AllTicketWidget(),
              ],
            ),
          ),
          Positioned(
            bottom: 40.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.specialBlue,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/filter.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 6.w),
                    TextWidget(
                      text: 'Фильтр',
                      style: AppTypography.body14.copyWith(
                        color: AppColors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(
                      'assets/svg/graphic.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 6.w),
                    TextWidget(
                      text: 'График цен',
                      style: AppTypography.body14.copyWith(
                        color: AppColors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

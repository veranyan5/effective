// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_page_search_widget.dart';
import '../widgets/offer_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(LoadOffersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.only(top: 28.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TextWidget(
                      text: 'Поиск дешевых\nавиабилетов',
                      style: AppTypography.heading22.copyWith(color: AppColors.white),
                      align: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  const HomePageSearchWidget(),
                  SizedBox(height: 32.h),
                  TextWidget(
                    text: 'Музыкально отлететь',
                    style: AppTypography.heading22.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 25.h),
                  BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    builder: (context, state) {
                      return state is HomePageLoaded
                          ? OfferListWidget(
                              offerList: state.offers,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

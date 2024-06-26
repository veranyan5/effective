// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/typography.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../search/presentation/bloc/search_bloc/search_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_page_search_widget.dart';
import '../widgets/offer_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = GetIt.I.get<HomeBloc>();
  late final SearchBloc searchBloc;
  @override
  void initState() {
    searchBloc = context.read<SearchBloc>();
    searchBloc.add(InitValueFromStorage());
    homeBloc.add(LoadOffersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
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
                  HomePageSearchWidget(
                    searchBloc: searchBloc,
                    iconPath: 'assets/svg/search.svg',
                    iconColor: AppColors.basicBlack,
                  ),
                  SizedBox(height: 32.h),
                  TextWidget(
                    text: 'Музыкально отлететь',
                    style: AppTypography.heading22.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 25.h),
                  BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    builder: (context, state) {
                      switch (state) {
                        case (HomePageLoading()):
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        case (HomePageLoaded()):
                          {
                            // return SizedBox();
                            return OfferListWidget(offerList: state.offers);
                          }
                        default:
                          return const SizedBox();
                      }
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

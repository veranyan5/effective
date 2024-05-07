// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app_colors.dart';
import '../../../search/presentation/bloc/search_bloc.dart';
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
  final HomeBloc homeBloc = GetIt.I.get<HomeBloc>();
  late final SearchBloc searchBloc;
  @override
  void initState() {
    searchBloc = context.read<SearchBloc>();
    homeBloc.add(LoadOffersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  HomePageSearchWidget(
                    searchBloc: searchBloc,
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
                            return OfferListWidget(offerList: state.offers);
                          }
                        default:
                          return const SizedBox();
                      }
                      // return state is HomePageLoading
                      //     ? const Center(
                      //         child: CircularProgressIndicator(),
                      //       )
                      //     : OfferListWidget(
                      //         offerList: state.offers,
                      //       );
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

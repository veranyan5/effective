// ignore_for_file: unnecessary_statements

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/features/search/presentation/bloc/search_bloc.dart';
import 'src/core/theme.dart';
import 'src/features/home/domain/usecases/api_service.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() {
  final dio = Dio();
  final talker = TalkerFlutter.init();
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ScreenUtilInit(
          builder: (context, _) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc(),
                ),
                BlocProvider<SearchBloc>(
                  create: (context) => SearchBloc(),
                ),
              ],
              child: const HomePage(),
            );
          },
        ),
      ),
    ],
  );
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        responsePen: AnsiPen()..green,
      ),
    ),
  );
  GetIt.I.registerLazySingleton<Dio>(() => dio);
  GetIt.I.registerLazySingleton<HomeBloc>(() => HomeBloc());
  GetIt.I.registerLazySingleton<Talker>(() => talker);
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService(GetIt.I.get<Dio>()));
  runApp(
    MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
    ),
  );
}

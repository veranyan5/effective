import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/core/repositories/api_service.dart';
import 'src/core/repositories/storage_service.dart';
import 'src/core/theme.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';
import 'src/features/main/presentation/pages/main_page.dart';
import 'src/features/search/presentation/bloc/all_tickets_bloc/all_tickets_bloc.dart';
import 'src/features/search/presentation/bloc/flight_bloc/flight_bloc.dart';
import 'src/features/search/presentation/bloc/search_bloc/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dio = Dio();
  final talker = TalkerFlutter.init();
  await StorageService.instance.init();

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        responsePen: AnsiPen()..green(),
      ),
    ),
  );

  GetIt.I.registerLazySingleton<Dio>(() => dio);
  GetIt.I.registerLazySingleton<Talker>(() => talker);
  GetIt.I.registerLazySingleton<HomeBloc>(() => HomeBloc());
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService(GetIt.I.get<Dio>()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<FlightBloc>(
          create: (context) => FlightBloc(),
        ),
        BlocProvider<AllTicketsBloc>(
          create: (context) => AllTicketsBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        builder: (context, _) {
          return MaterialApp(
            theme: AppTheme.themeData,
            debugShowCheckedModeBanner: false,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/core/router.dart';
import 'src/core/theme.dart';
import 'src/features/home/domain/usecases/api_service.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';
import 'src/features/search/presentation/bloc/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dio = Dio();
  final talker = TalkerFlutter.init();

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
      ],
      child: ScreenUtilInit(
        builder: (context,_) {
          return MaterialApp.router(
            locale: Locale('ru'),
            routerConfig: AppRouter.router,
            
            theme: AppTheme.themeData,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

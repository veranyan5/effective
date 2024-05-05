import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/core/theme.dart';
import 'src/features/home/presentation/pages/pages.dart';

void main() {
  final dio = Dio();
  GetIt.I.registerLazySingleton<Dio>(() => dio);
  runApp(
    MaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

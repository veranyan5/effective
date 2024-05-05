import 'package:dio/dio.dart';
import 'package:effective_test/src/core/theme.dart';
import 'package:effective_test/src/features/home/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final Dio dio = Dio();
  GetIt.I.registerLazySingleton<Dio>(() => dio);
  runApp(
    MaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

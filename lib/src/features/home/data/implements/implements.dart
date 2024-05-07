// ignore_for_file: directives_ordering, sort_constructors_first

import '../sources/sources.dart';
import '../../domain/repositories/api_repo.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImp({required this.remoteDataSource});

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}

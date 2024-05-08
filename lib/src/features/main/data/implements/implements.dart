
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class MainRepositoryImp implements MainRepository{

        final MainRemoteDataSource remoteDataSource;
        MainRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    
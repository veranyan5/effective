import '../repositories/repositories.dart';

class GetSearchUseCase {
  GetSearchUseCase({required this.repository});
  final SearchRepository repository;

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
}

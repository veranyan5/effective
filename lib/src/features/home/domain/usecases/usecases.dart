import '../repositories/repositories.dart';

class GetHomeUseCase {
  GetHomeUseCase({required this.repository});
  final HomeRepository repository;

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
}

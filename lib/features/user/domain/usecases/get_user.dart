import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository _userRepository;
  GetUser({
    UserRepository? userRepository,
  }) : _userRepository = userRepository ?? locator<UserRepository>();

  Future<User> call() async {
    const String userId = '1';
    final user = await _userRepository.getUser(userId: userId);
    return user;
  }
}

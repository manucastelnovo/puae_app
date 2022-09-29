import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';

final userData = {
  'id': 'testId',
  'name': 'manu420',
  'correo': 'marnutskate@gmail.com',
  'password': '12345678',
  'userType': 'admin',
};

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<void> deleteUser({required String userId}) async {}

  @override
  Future<User> getUser({required String userId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User.fromJson(userData);
  }

  @override
  Future<void> updateUserName(
      {required String userId, required String newUserName}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> createdUser({required String userName}) async {}
}

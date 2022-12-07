import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:puae_app/utils/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<void> deleteUser({required String userId}) async {}

  @override
  Future<User> getUser({required String userId}) async {
    try {
      final userData = await dio.get('/signin');
      return User.fromJson(userData.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUserName(
      {required String userId, required String newUserName}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> createdUser({required String userName}) async {}
}

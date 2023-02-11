import 'package:puae_app/features/user/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUser({required String name});
  Future<void> updateUserName(
      {required String userId, required String newUserName});
  Future<void> deleteUser({required String userId});
  Future<void> createdUser({required User newUser});
  User? get currentUser;
}

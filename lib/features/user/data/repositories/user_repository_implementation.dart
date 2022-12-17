import 'package:dio/dio.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:puae_app/utils/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<void> deleteUser({required String userId}) async {}

  @override
  Future<User> getUser({required String userId}) async {
    try {
      Response response = await Dio().get(
          "https://2570-2803-2a00-a-e097-6959-e0e9-2198-4b3e.sa.ngrok.io/signin");
      print(response.data.toString());
      return User.fromJson(response.data);
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

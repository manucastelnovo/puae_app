import 'package:dio/dio.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:puae_app/utils/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  User? _currentUser;

  @override
  Future<void> deleteUser({required String userId}) async {}

  @override
  Future<User> getUser({required String userId}) async {
    try {
      Response response = await Dio().get(
          "https://5170-2803-2a00-9-b97f-b176-e933-afd2-df78.sa.ngrok.io/user");
      print(response.data.toString());
      print('estoy implementacion');
      _currentUser = User.fromJson(response.data);
      print('setear _currentUser');
      print(_currentUser);
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

  @override
  User? get currentUser => _currentUser;
}

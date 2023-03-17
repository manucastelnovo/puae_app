import 'package:dio/dio.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:puae_app/utils/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepositoryImplementation implements UserRepository {
  User? _currentUser;

  @override
  Future<void> deleteUser({required String userId}) async {}

  @override
  Future<User> getUser({required String name}) async {
    try {
      print("${dotenv.env['SERVER_ADDRESS']}/api/users/$name");
      Response response =
          await Dio().get("${dotenv.env['SERVER_ADDRESS']}/api/users/$name");
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
  Future<void> createdUser({required User newUser}) async {
    try {
      await Dio()
          .post("${dotenv.env['SERVER_ADDRESS']}/", data: newUser.toJson());
    } catch (e) {
      throw (e);
    }
  }

  @override
  User? get currentUser => _currentUser;
}

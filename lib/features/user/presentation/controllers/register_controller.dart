import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';

class RegisterController extends ChangeNotifier {
  final UserRepository _userRepository;

  RegisterController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  User? _newUser;

  User? get currentUser => _newUser;

  Future<void> createUser(User newUser) async {
    try {
      print('estoy controller del registro');
      await _userRepository.createdUser(newUser: newUser);
      _newUser = _userRepository.currentUser;
      print(_newUser);
      print('getuser');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      notifyListeners();
    }
  }

  String? validatorPass(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    }
    return null;
  }

  String? validatorUser(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    }
    return null;
  }

  String? validatorEmail(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    }
    return null;
  }
}

final registerProvider = ChangeNotifierProvider((ref) => RegisterController(
      userRepository: locator<UserRepository>(),
    ));

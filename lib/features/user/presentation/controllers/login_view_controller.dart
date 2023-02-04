import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';

class UserViewController extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  bool isLoading = true;
  User? _currentUser;

  User? get currentUser => _currentUser;

  String? validatorPass(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else if (value == currentUser!.password) {
      print('La contrasenha es correcta');

      return null;
    }
    return 'contrasenha incorrecta';
  }

  String? validatorUser(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else if (value == currentUser!.name) {
      print('el usuario es correcto');

      return null;
    }
    return 'usuario incorrecto';
  }

  Future<void> getUser(String name) async {
    try {
      print('estoy controller');
      await _userRepository.getUser(name: name);
      _currentUser = _userRepository.currentUser;
      print(_currentUser);
      print('getuser');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

final loginViewProvider = ChangeNotifierProvider((ref) => UserViewController(
      userRepository: locator<UserRepository>(),
    ));

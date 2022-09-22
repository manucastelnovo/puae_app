import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:puae_app/features/user/domain/usecases/get_user.dart';

class UserViewController extends ChangeNotifier {
  final GetUser _getUser;

  UserViewController({
    GetUser? getUser,
  }) : _getUser = getUser ?? GetUser();

  bool isLoading = true;
  User? _currentUser;

  User? get currentUser => _currentUser;

  String? valitatorPass(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else if (value == currentUser!.password) {
      print('La contrasenha es correcta');

      return null;
    }
    return 'contrasenha incorrecta';
  }

  String? valitatorUser(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else if (value == currentUser!.name) {
      print('el usuario es correcto');

      return null;
    }
    return 'usuario incorrecto';
  }

  Future<void> getUser() async {
    try {
      _currentUser = await _getUser();
      print(_currentUser);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

final userViewProvider = ChangeNotifierProvider((ref) => UserViewController());

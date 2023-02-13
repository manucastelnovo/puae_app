import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';

class DashboardViewController extends ChangeNotifier {
  DashboardViewController();
}

final dashboardViewProvider =
    ChangeNotifierProvider((ref) => DashboardViewController());

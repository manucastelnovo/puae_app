import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/food/domain/models/food.dart';
import 'package:puae_app/features/food/domain/repositories/food_repository.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardViewController extends ChangeNotifier {
  final UserRepository _userRepository;
  final FoodRepository _foodRepository;

  DashboardViewController(
      {required UserRepository userRepository,
      required FoodRepository foodRepository})
      : _userRepository = userRepository,
        _foodRepository = foodRepository;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<Food>? _allUserFoods;

  List<Food>? get allUserFoods => _allUserFoods;

  bool isLoading = true;

  final List<charts.Series<dynamic, String>> seriesList = [
    charts.Series<OrdinalSalesGreen, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (OrdinalSalesGreen sales, _) => sales.mounth,
      measureFn: (OrdinalSalesGreen sales, _) => sales.money,
      data: [OrdinalSalesGreen('febrero', 1000000)],
    ),
    charts.Series<OrdinalSalesRed, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (OrdinalSalesRed sales, _) => sales.mounth,
      measureFn: (OrdinalSalesRed sales, _) => sales.money,
      data: [OrdinalSalesRed('febrero', 500000)],
    ),
  ];

  Future<void> getAllFood({required int userId}) async {
    try {
      await _foodRepository.getAllFood(userId: userId);
      _allUserFoods = _foodRepository.allUserFood;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

final dashboardViewProvider =
    ChangeNotifierProvider((ref) => DashboardViewController(
          userRepository: locator<UserRepository>(),
          foodRepository: locator<FoodRepository>(),
        ));

class OrdinalSalesGreen {
  final String mounth;
  final int money;

  OrdinalSalesGreen(this.mounth, this.money);
}

class OrdinalSalesRed {
  final String mounth;
  final int money;

  OrdinalSalesRed(this.mounth, this.money);
}

import 'package:puae_app/features/menu/domain/models/menu.dart';
import 'package:puae_app/features/menu/domain/repositories/menu_repository.dart';

final menuData = {
  'id': 'menuId',
  'userId': 'manu420',
  'foodAndPrice': [
    {
      'food': 'Hamburguesa',
      'price': 10,
    },
    {
      'food': 'Pizza',
      'price': 15,
    },
    {
      'food': 'Hot Dog',
      'price': 5,
    },
  ],
};

class MenuRepositoryImplementation implements MenuRepository {
  @override
  Future<void> deleteMenu({required String menuId}) async {}

  @override
  Future<Menu> getMenu({required String menuId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return Menu.fromJson(menuData);
  }

  @override
  Future<void> updateMenuName(
      {required String menuId, required String newMenuName}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> createdMenu({required String menuName}) async {}
}

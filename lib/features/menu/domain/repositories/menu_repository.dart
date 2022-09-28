import 'package:puae_app/features/menu/domain/models/menu.dart';

abstract class MenuRepository {
  Future<Menu> getMenu({required String menuId});
  Future<void> updateMenuName(
      {required String menuId, required String newMenuName});
  Future<void> deleteMenu({required String menuId});
  Future<void> createdMenu({required String menuName});
}

import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/menu/domain/models/menu.dart';
import 'package:puae_app/features/menu/domain/repositories/menu_repository.dart';

class GetMenu {
  final MenuRepository _menuRepository;
  GetMenu({
    MenuRepository? menuRepository,
  }) : _menuRepository = menuRepository ?? locator<MenuRepository>();

  Future<Menu> call() async {
    const String menuId = 'testId2';
    final menu = await _menuRepository.getMenu(menuId: menuId);
    return menu;
  }
}

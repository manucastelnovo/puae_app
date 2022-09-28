class Menu {
  final String menuId;
  final String ownerMenuId;
  final List<Map<String, dynamic>> foodAndPrice;

  Menu({
    required this.menuId,
    required this.ownerMenuId,
    required this.foodAndPrice,
  });

  factory Menu.fromJson(Map<String, dynamic> data) {
    return Menu(
      menuId: data['id'],
      ownerMenuId: data['ownerMenuId'],
      foodAndPrice: data['foodAndPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': menuId,
      'ownerMenuId': ownerMenuId,
      'foodAndPrice': foodAndPrice,
    };
  }
}

import 'package:puae_app/features/food/domain/models/food.dart';

abstract class FoodRepository {
  Future<List<Food>>? getAllFood({required int userId});
  Future<void> updateFoodName({
    required String foodId,
  });
  Future<void> deleteFood({required int foodId});
  Future<void> createdFood({required Food newFood});
  List<Food>? get allUserFood;
}

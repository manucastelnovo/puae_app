import 'package:puae_app/features/food/domain/models/food.dart';

abstract class FoodRepository {
  Future<Food> getAllFood({required int userId});
  Future<void> updateFoodName({
    required String foodId,
  });
  Future<void> deleteFood({required int foodId});
  Future<void> createdFood({required Food newFood});
  Food? get allFood;
}

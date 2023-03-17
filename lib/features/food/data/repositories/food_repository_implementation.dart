import 'package:dio/dio.dart';
import 'package:puae_app/features/food/domain/models/food.dart';
import 'package:puae_app/features/food/domain/repositories/food_repository.dart';
import 'package:puae_app/utils/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FoodRepositoryImplementation implements FoodRepository {
  @override
  // TODO: implement allFood
  List<Food>? get allUserFood => throw UnimplementedError();

  @override
  Future<void> createdFood({required Food newFood}) async {
    try {
      await Dio()
          .post("${dotenv.env['SERVER_ADDRESS']}/", data: newFood.toJson());
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future<void> deleteFood({required int foodId}) {
    // TODO: implement deleteFood
    throw UnimplementedError();
  }

  @override
  Future<List<Food>> getAllFood({required int userId}) async {
    try {
      Response response =
          await Dio().get("${dotenv.env['SERVER_ADDRESS']}/api/foods/$userId");
      return response.data.map((e) => Food.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateFoodName({required String foodId}) {
    // TODO: implement updateFoodName
    throw UnimplementedError();
  }
}

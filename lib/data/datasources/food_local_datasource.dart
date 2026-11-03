import '../models/food_model.dart';

class FoodLocalDataSource {
  final List<FoodModel> _foods = [];

  List<FoodModel> getFoods() => List.unmodifiable(_foods);

  void addFood(FoodModel food) => _foods.add(food);

  void deleteFood(String id) => _foods.removeWhere((food) => food.id == id);
}

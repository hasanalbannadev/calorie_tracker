// ============================================================
// food_repository.dart  (Domain layer)
// Repository of contract (abstract class)। Data layer  implement ।
// ============================================================
import '../entities/food_entity.dart';

abstract class FoodRepository {
  List<FoodEntity> getFoods();
  void addFood(FoodEntity food);
  void deleteFood(String id);
}

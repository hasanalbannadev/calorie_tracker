// ============================================================
// add_food_usecase.dart  (Domain layer)
// new food add ।
// ============================================================
import '../entities/food_entity.dart';
import '../repositories/food_repository.dart';

class AddFoodUseCase {
  final FoodRepository repository;

  const AddFoodUseCase(this.repository);

  void call(FoodEntity food) => repository.addFood(food);
}

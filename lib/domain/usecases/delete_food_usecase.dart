// ============================================================
// delete_food_usecase.dart  (Domain layer)
// id to delete food।
// ============================================================
import '../repositories/food_repository.dart';

class DeleteFoodUseCase {
  final FoodRepository repository;

  const DeleteFoodUseCase(this.repository);

  void call(String id) => repository.deleteFood(id);
}

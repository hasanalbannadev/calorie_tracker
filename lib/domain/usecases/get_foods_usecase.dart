// ============================================================
// get_foods_usecase.dart  (Domain layer)
// all food list।
// ============================================================
import '../entities/food_entity.dart';
import '../repositories/food_repository.dart';

class GetFoodsUseCase {
  final FoodRepository repository;

  const GetFoodsUseCase(this.repository);

  List<FoodEntity> call() => repository.getFoods();
}

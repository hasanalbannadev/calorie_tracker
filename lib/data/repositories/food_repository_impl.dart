// ============================================================
// food_repository_impl.dart  (Data layer)
// ============================================================
import '../../domain/entities/food_entity.dart';
import '../../domain/repositories/food_repository.dart';
import '../datasources/food_local_datasource.dart';
import '../models/food_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodLocalDataSource dataSource;

  const FoodRepositoryImpl(this.dataSource);

  @override
  List<FoodEntity> getFoods() => dataSource.getFoods();

  @override
  void addFood(FoodEntity food) {
    dataSource.addFood(FoodModel.fromEntity(food));
  }

  @override
  void deleteFood(String id) => dataSource.deleteFood(id);
}

// ============================================================
// food_model.dart  (Data layer)
// ============================================================
import '../../domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  const FoodModel({
    required super.id,
    required super.name,
    required super.calories,
  });

  /// Domain entity  Data model
  factory FoodModel.fromEntity(FoodEntity entity) {
    return FoodModel(
      id: entity.id,
      name: entity.name,
      calories: entity.calories,
    );
  }
}

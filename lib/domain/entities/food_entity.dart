// ============================================================
// food_entity.dart  (Domain layer)
// ============================================================
class FoodEntity {
  final String id; // to delete for unique id
  final String name; // food name
  final double calories; // calorie (kcal)

  const FoodEntity({
    required this.id,
    required this.name,
    required this.calories,
  });
}

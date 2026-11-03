// ============================================================
// food_notifier.dart  (Presentation layer)
//  UI (list + summary)  update ।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/food_entity.dart';
import 'food_providers.dart';

class FoodNotifier extends Notifier<List<FoodEntity>> {
  @override
  List<FoodEntity> build() {
    // starting list empty (data reset app restart)
    return ref.read(getFoodsUseCaseProvider).call();
  }

  /// new food add
  void addFood({required String name, required double calories}) {
    final food = FoodEntity(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: name.trim(),
      calories: calories,
    );
    ref.read(addFoodUseCaseProvider).call(food);
    state = ref.read(getFoodsUseCaseProvider).call(); // new list => UI update
  }

  /// to delete food of using id
  void deleteFood(String id) {
    ref.read(deleteFoodUseCaseProvider).call(id);
    state = ref.read(getFoodsUseCaseProvider).call();
  }
}

final foodListProvider = NotifierProvider<FoodNotifier, List<FoodEntity>>(
  FoodNotifier.new,
);

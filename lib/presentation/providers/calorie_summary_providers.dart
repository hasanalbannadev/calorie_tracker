// ============================================================
// calorie_summary_providers.dart  (Presentation layer)
//   Total Calories, Daily Goal, Remaining Calories
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import 'food_notifier.dart';

/// total calorie
final totalCaloriesProvider = Provider<double>((ref) {
  final foods = ref.watch(foodListProvider);
  return foods.fold<double>(0, (sum, food) => sum + food.calories);
});

/// daily default calorie
final dailyGoalProvider = Provider<double>((ref) => AppConstants.dailyGoal);

/// remaining calorie = goal - total
final remainingCaloriesProvider = Provider<double>((ref) {
  final goal = ref.watch(dailyGoalProvider);
  final total = ref.watch(totalCaloriesProvider);
  return goal - total;
});

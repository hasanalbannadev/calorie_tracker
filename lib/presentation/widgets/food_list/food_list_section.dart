// ============================================================
// food_list_section.dart
// "Today's Food List"  + ListView.builder
// ListView (NeverScrollableScrollPhysics),
//  Home Screen - |
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../providers/food_notifier.dart';
import 'empty_food_view.dart';
import 'food_list_item.dart';

class FoodListSection extends ConsumerWidget {
  const FoodListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Food List",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        if (foods.isEmpty)
          const EmptyFoodView()
        else
          // Assignment requirement: ListView.builder
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];
              return FoodListItem(
                key: ValueKey(food.id),
                food: food,
                onDelete:
                    () =>
                        ref.read(foodListProvider.notifier).deleteFood(food.id),
              );
            },
          ),
      ],
    );
  }
}

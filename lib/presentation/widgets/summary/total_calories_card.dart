// ============================================================
// total_calories_card.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/number_formatter.dart';
import '../../providers/calorie_summary_providers.dart';
import '../common/summary_card_container.dart';

class TotalCaloriesCard extends ConsumerWidget {
  const TotalCaloriesCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(totalCaloriesProvider);
    final goal = ref.watch(dailyGoalProvider);

    return SummaryCardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              'Total Calories Consumed',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: NumberFormatter.format(total),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const TextSpan(
                      text: ' ${AppConstants.unit}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(height: 4),
            const Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 8),
            Text(
              'Daily Goal: ${NumberFormatter.format(goal)} ${AppConstants.unit}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

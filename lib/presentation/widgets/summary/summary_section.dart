import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/number_formatter.dart';
import '../../providers/calorie_summary_providers.dart';
import 'mini_summary_card.dart';
import 'total_calories_card.dart';

class SummarySection extends ConsumerWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(dailyGoalProvider);
    final remaining = ref.watch(remainingCaloriesProvider);

    return Column(
      children: [
        const TotalCaloriesCard(),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: MiniSummaryCard(
                title: 'Daily Goal',
                value: NumberFormatter.format(goal),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MiniSummaryCard(
                title: 'Remaining',
                value: NumberFormatter.format(remaining),
                valueColor:
                    remaining < 0 ? AppColors.danger : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

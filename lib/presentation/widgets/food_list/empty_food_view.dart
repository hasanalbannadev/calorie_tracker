// ============================================================
// empty_food_view.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EmptyFoodView extends StatelessWidget {
  const EmptyFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Text(
          'No food added yet.\nTap + to add your first item.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}

// ============================================================
// summary_card_container.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SummaryCardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const SummaryCardContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.background,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.border),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

// ============================================================
// date_label.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_formatter.dart';

class DateLabel extends StatelessWidget {
  const DateLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormatter.fullDate(DateTime.now()),
      style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
    );
  }
}

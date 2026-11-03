// ============================================================
// add_food_button.dart
// ============================================================
import 'package:flutter/material.dart';

import 'add_food_sheet.dart';

class AddFoodButton extends StatelessWidget {
  const AddFoodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add Food',
      onPressed: () => showAddFoodSheet(context),
      child: const Icon(Icons.add, size: 34),
    );
  }
}

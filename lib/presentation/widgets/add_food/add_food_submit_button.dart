// ============================================================
// add_food_submit_button.dart
// ============================================================
import 'package:flutter/material.dart';

class AddFoodSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddFoodSubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'Add Food',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}

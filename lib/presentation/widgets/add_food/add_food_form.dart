// ============================================================
// add_food_form.dart
// Add Food form logic:
//   - Food Name + Calorie Amount (kcal)
//   - Validation pass and  list add and sheet close
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/validators.dart';
import '../../providers/food_notifier.dart';
import 'add_food_field.dart';
import 'add_food_submit_button.dart';

class AddFoodForm extends ConsumerStatefulWidget {
  const AddFoodForm({super.key});

  @override
  ConsumerState<AddFoodForm> createState() => _AddFoodFormState();
}

class _AddFoodFormState extends ConsumerState<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _calorieController = TextEditingController();

  @override
  void dispose() {
    // memory leak safe controller dispose
    _nameController.dispose();
    _calorieController.dispose();
    super.dispose();
  }

  void _submit() {
    //  validation
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(foodListProvider.notifier)
        .addFood(
          name: _nameController.text,
          calories: double.parse(_calorieController.text.trim()),
        );
    Navigator.of(context).pop(); // sheet close
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddFoodField(
            controller: _nameController,
            label: 'Food Name',
            hint: 'e.g. Rice',
            icon: Icons.restaurant_outlined,
            validator: Validators.foodName,
            autofocus: true,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: 16),
          AddFoodField(
            controller: _calorieController,
            label: 'Calorie Amount (kcal)',
            hint: 'e.g. 250',
            icon: Icons.local_fire_department_outlined,
            validator: Validators.calorie,
            textInputAction: TextInputAction.done,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 24),
          AddFoodSubmitButton(onPressed: _submit),
        ],
      ),
    );
  }
}

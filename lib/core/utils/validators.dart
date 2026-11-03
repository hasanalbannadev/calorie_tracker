// ============================================================
// validators.dart
// Add Food form validation:
// ============================================================
class Validators {
  Validators._();

  static String? foodName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Food name is required';
    }
    return null;
  }

  static String? calorie(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Calorie amount is required';
    }
    final number = double.tryParse(value.trim());
    if (number == null || !number.isFinite) {
      return 'Enter a valid number';
    }
    if (number <= 0) {
      return 'Calories must be greater than 0';
    }
    return null;
  }
}

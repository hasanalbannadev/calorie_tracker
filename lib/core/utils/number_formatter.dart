// ============================================================
// number_formatter.dart
// ============================================================
class NumberFormatter {
  NumberFormatter._();

  static String format(double value) {
    final isWhole = value == value.truncateToDouble();
    final text =
        isWhole
            ? value.abs().toStringAsFixed(0)
            : value.abs().toStringAsFixed(1);

    final parts = text.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    final buffer = StringBuffer();
    for (var i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) buffer.write(',');
      buffer.write(integerPart[i]);
    }

    final sign = value < 0 ? '-' : '';
    return '$sign$buffer$decimalPart';
  }
}

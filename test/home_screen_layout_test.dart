import 'package:calorie_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const sizes = <Size>[
    Size(320, 480),
    Size(360, 640),
    Size(412, 915),
    Size(800, 1280),
  ];

  for (final size in sizes) {
    testWidgets('No layout error at ${size.width}x${size.height}', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const ProviderScope(child: CalorieTrackerApp()));
      await tester.pumpAndSettle();

      expect(find.text('Calorie Tracker'), findsOneWidget);
      expect(find.text("Today's Food List"), findsOneWidget);

      for (var i = 1; i <= 3; i++) {
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextFormField).at(0), 'Food $i');
        await tester.enterText(find.byType(TextFormField).at(1), '${i * 100}');
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add Food'));
        await tester.pumpAndSettle();
      }

      expect(find.text('Food 1'), findsOneWidget);
      expect(find.text('Food 3'), findsOneWidget);

      expect(tester.takeException(), isNull);
    });
  }
}

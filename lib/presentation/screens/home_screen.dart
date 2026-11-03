// ============================================================
// home_screen.dart  (Presentation layer)
// ============================================================
import 'package:flutter/material.dart';

import '../widgets/add_food/add_food_button.dart';
import '../widgets/food_list/food_list_section.dart';
import '../widgets/header/app_header.dart';
import '../widgets/header/date_label.dart';
import '../widgets/summary/summary_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 96),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(), // name + calendar icon
                  SizedBox(height: 2),
                  DateLabel(), // today's date
                  SizedBox(height: 14),
                  SummarySection(), // 3 summary card
                  SizedBox(height: 20),
                  FoodListSection(), // title and + ListView.builder
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const AddFoodButton(), // Add Food button
    );
  }
}

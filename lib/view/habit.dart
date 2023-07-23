import 'package:flutter/material.dart';
import 'package:habit_tracker/widget/bottom_sheet.dart';
import 'package:habit_tracker/widget/list_tile.dart';

class HabitView extends StatelessWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Habits"),
        actions: [
          IconButton(
              onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const AddHabitBottomSheet()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => const HabitListTile()),
    );
  }
}

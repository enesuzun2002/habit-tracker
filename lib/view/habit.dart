import 'package:flutter/material.dart';
import 'package:habit_tracker/test_data.dart';
import 'package:habit_tracker/widget/bottom_sheet.dart';
import 'package:habit_tracker/widget/list_tile.dart';

class HabitView extends StatefulWidget {
  const HabitView({super.key});

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Habits"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const AddHabitBottomSheet())
                    .then((value) => setState(() {}));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                        "Are you sure you want to remove this habit?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          habits.removeAt(index);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text("Ok"),
                      )
                    ],
                  )),
          child: HabitListTile(
            item: habits[index],
          ),
        ),
      ),
    );
  }
}

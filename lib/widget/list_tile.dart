import 'package:flutter/material.dart';

class HabitListTile extends StatefulWidget {
  const HabitListTile({super.key});

  @override
  State<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends State<HabitListTile> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isCompleted,
      title: const Text("Habit - 1"),
      subtitle: const Text("Habit - 1 Description"),
      onChanged: (value) {
        isCompleted = value!;
        setState(() {});
      },
    );
  }
}

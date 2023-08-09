import 'package:flutter/material.dart';
import 'package:habit_tracker/model/habit.dart';

class HabitListTile extends StatefulWidget {
  final HabitModel item;
  const HabitListTile({super.key, required this.item});

  @override
  State<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends State<HabitListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.item.isCompleted,
      title: Text(widget.item.name),
      subtitle: Text(widget.item.description),
      onChanged: (value) {
        widget.item.isCompleted = value!;
        setState(() {});
      },
    );
  }
}

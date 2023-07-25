import 'package:flutter/material.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:habit_tracker/test_data.dart';

class AddHabitBottomSheet extends StatelessWidget {
  const AddHabitBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final HabitModel model = HabitModel(name: "", description: "");
    final formKey = GlobalKey<FormState>();

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Habit",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                onChanged: (value) => model.name = value,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value != null && value.isNotEmpty ||
                      value != null && value != "") return null;
                  return "Please write a name!";
                },
              ),
              TextFormField(
                onChanged: (value) => model.description = value,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                validator: (value) {
                  if (value != null && value.isNotEmpty ||
                      value != null && value != "") return null;
                  return "Please write a description!";
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    habits.add(model);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

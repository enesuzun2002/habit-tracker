import 'package:flutter/material.dart';
import 'package:habit_tracker/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      ),
      home: const LoginView(),
    );
  }
}

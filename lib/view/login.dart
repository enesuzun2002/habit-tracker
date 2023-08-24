import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/view/habit.dart';
import 'package:habit_tracker/view/password.dart';
import 'package:habit_tracker/view/register.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterView())),
            child: const Text("Register."))
      ],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: GoogleFonts.bebasNeue(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        color: Theme.of(context).colorScheme.primary),
                    children: const <TextSpan>[
                      TextSpan(text: "Habit\n"),
                      TextSpan(text: "Tracker"),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: "E-mail"),
                  validator: (value) {
                    if (value != null && value.isNotEmpty ||
                        value != null && value != "") return null;
                    return "Please write a valid e-mail address!";
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value != null && value.isNotEmpty ||
                        value != null && value != "") return null;
                    return "Please write a valid password!";
                  },
                ),
                const SizedBox(height: 5.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Did you forget your password?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordView())),
                    child: const Text("Reset my password."),
                  )
                ]),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HabitView()));
                      }
                    },
                    child: const Text("LOGIN"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

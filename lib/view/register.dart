import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/view/login.dart';

import 'habit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    String password = "";
    String confirmPassword = "";
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        const Text("Do you have an account?"),
        TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginView())),
            child: const Text("Login."))
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
                  onChanged: (value) => password = value,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value != null && value.isNotEmpty ||
                        value != null && value != "") return null;
                    return "Please write a valid password!";
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) => confirmPassword = value,
                  decoration:
                      const InputDecoration(hintText: "Confirm Password"),
                  validator: (value) {
                    if (value != null && value.isNotEmpty ||
                        value != null && value != "") return null;

                    if (password != confirmPassword) {
                      return "Passwords don't match!";
                    }

                    return "Please write a valid password!";
                  },
                ),
                const SizedBox(height: 10.0),
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
                    child: const Text("REGISTER"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

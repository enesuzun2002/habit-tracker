import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    child: const Text("RESET PASSWORD"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

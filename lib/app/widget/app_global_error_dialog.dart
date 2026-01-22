import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppGlobalErrorDialog extends StatelessWidget {
  final UiGlobalError error;

  const AppGlobalErrorDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black, // Czarny kolor tła
      title: const Text(
        "Ups...",
        style: TextStyle(color: Colors.white), // Biały tekst
      ),
      content: const Text(
        "Coś poszło nie tak :(",
        style: TextStyle(color: Colors.white), // Biały tekst
      ),
      actions: [
        TextButton(
          onPressed: () => context.navigator.pop(),
          child: const Text(
            "Zamknij",
            style: TextStyle(color: Colors.white), // Biały tekst
          ),
        ),
        if (error.canRetry)
          TextButton(
            onPressed: () {
              context.navigator.pop();
              error.retry!();
            },
            child: const Text(
              "Spróbuj ponownie",
              style: TextStyle(color: Colors.white), // Biały tekst
            ),
          ),
      ],
    );
  }
}

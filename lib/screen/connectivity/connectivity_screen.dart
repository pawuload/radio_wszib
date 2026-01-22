import 'package:flutter/material.dart';

class ConnectivityScreen extends StatelessWidget {
  static const route = '/connectivity';

  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.0,
            children: [
              Text(
                "Ups! Internet się chyba obraził...",
                // style: TealText.header,
                textAlign: TextAlign.center,
              ),
              Text(
                "Bez niego niewiele zdziałamy. Daj mu chwilę albo pogódźcie się ręcznie (czytaj: włącz Wi-Fi lub dane 😅).",
                // style: TealText.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

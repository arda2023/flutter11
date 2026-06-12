import 'package:flutter/material.dart';
import 'package:flutter11/home.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Hier wird das globale Shadcn-Theme entsprechend der Dokumentation konfiguriert
    return ShadApp(
      themeMode: ThemeMode.light, // Oder ThemeMode.dark / ThemeMode.system
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme:
            const ShadZincColorScheme.light(), // Nutzt das populäre Zinc-Farbschema
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
      ),
      home: const HomePage(),
    );
  }
}

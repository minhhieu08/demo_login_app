import 'package:agribank_app/screens/home_screen.dart';
import 'package:agribank_app/screens/login_screen.dart';
import 'package:agribank_app/widgets/branch_list.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 147, 229, 250),
    surface: Color.fromARGB(255, 255, 255, 255)
  ),
  textTheme: GoogleFonts.lexendTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const LoginScreen(),
    );
  }
}

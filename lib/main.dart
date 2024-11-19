import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app_flutter/screens/categories.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 59, 212, 123),
      brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const MaterialApp(
    home: CategoriesScreen(),
  ));
}

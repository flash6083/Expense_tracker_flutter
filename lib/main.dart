import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 195, 174, 16),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kDarkColorScheme.onSecondaryContainer,
                  letterSpacing: 0.1,
                ),
              ),
              bodyMedium: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kDarkColorScheme.primary,
                ),
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kColorScheme.onSecondaryContainer,
                  letterSpacing: 0.1,
                ),
              ),
              bodyMedium: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kColorScheme.primary,
                ),
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}

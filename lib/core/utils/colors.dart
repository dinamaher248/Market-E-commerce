import 'package:flutter/material.dart';

/// 🎨 الألوان الأساسية
const Color PrimaryColor = Color(0xFF3F80FF);
const Color TextColor = Color(0xFF001640);
const Color BorderColor = Color(0xFFB2CCFF);

/// 🎨 ColorScheme للوضع الفاتح
final ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: PrimaryColor,
  onPrimary: Colors.white,
  secondary: Color(0xFF5E8BFF),
  onSecondary: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  surface: Colors.white,
  onSurface: TextColor,
).copyWith(
  // 👇 مهم جداً علشان FAB.extended
  secondaryContainer: Colors.white, // خلفية الزر الأبيض
  onSecondaryContainer: PrimaryColor, // النص/الأيقونة أزرق
);

/// 🎨 ColorScheme للوضع الداكن
final ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: PrimaryColor,
  onPrimary: Colors.white,
  secondary: Color(0xFF5E8BFF),
  onSecondary: Colors.black,
  error: Colors.redAccent,
  onError: Colors.black,
  surface: Color(0xFF1E1E1E),
  onSurface: Colors.white,
).copyWith(
  // 👇 خليه أزرق والنص أبيض
  secondaryContainer: PrimaryColor,
  onSecondaryContainer: Colors.white,
);

/// 🌓 ThemeData Light
final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: TextColor,
    elevation: 0,
    iconTheme: IconThemeData(color: TextColor),
    titleTextStyle: TextStyle(
      color: TextColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: TextColor,
    ),
    headlineMedium: TextStyle(
      color: TextColor,
    ),
    headlineSmall: TextStyle(
      color: TextColor,
    ),
    bodyLarge: TextStyle(
      color: TextColor,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey[500]),
    prefixIconColor: Colors.grey[600],
    suffixIconColor: Colors.grey[600],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: BorderColor),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: PrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: PrimaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
  ),
);

/// 🌓 ThemeData Dark
final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    foregroundColor: darkColorScheme.onSurface,
    elevation: 0,
    iconTheme: IconThemeData(color: darkColorScheme.onSurface),
    titleTextStyle: TextStyle(
      color: darkColorScheme.onSurface,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: PrimaryColor, // زر أزرق
    foregroundColor: Colors.white, // الأيقونة / النص أبيض
    shape: CircleBorder(), // مهم علشان Material3 مايفرضش ستايل تاني
    extendedTextStyle: TextStyle(
      color: Colors.white, // النص الأبيض في FAB Extended
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: darkColorScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      color: darkColorScheme.onSurface.withOpacity(0.9),
    ),
    headlineSmall: TextStyle(
      color: darkColorScheme.onSurface.withOpacity(0.9),
    ),
    bodyLarge: TextStyle(
      color: darkColorScheme.onSurface.withOpacity(0.9),
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[400],
    ),
    labelLarge: const TextStyle(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColorScheme.surface,
    hintStyle: TextStyle(color: Colors.grey[500]),
    prefixIconColor: Colors.grey[400],
    suffixIconColor: Colors.grey[400],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: PrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.surface,
    selectedItemColor: PrimaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
);

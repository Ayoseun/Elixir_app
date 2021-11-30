//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xFF2B8984, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFF0D8A83), //10%
      100: const Color(0xff009999), //20%
      200: const Color(0xFFD8DBDB), //30%
      300: const Color(0xFF2B8984), //40%
      400: const Color(0xFF247373), //50%
      500: const Color(0xFF179397), //60%
      600: const Color(0xFF4BC9DA), //70%
      700: const Color(0xFF17A599), //80%
      800: const Color(0xFF0D8A83), //90%
      900: const Color(0xFF14C3CF), //100%
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/core/theme_provider.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return IconButton(
      onPressed: () {
        ref.read(themeProvider.notifier).state = 
          isDarkMode ? ThemeMode.light : ThemeMode.dark;
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
      ),
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
    );
  }
} 
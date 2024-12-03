import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/core/theme_provider.dart';
import 'package:tla_1_2_opsima/presentation/core/app_theme.dart';
import 'package:tla_1_2_opsima/presentation/home/home_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return MaterialApp(
      title: 'TLA 1.2 Opsima',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
} 
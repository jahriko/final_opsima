import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/presentation/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

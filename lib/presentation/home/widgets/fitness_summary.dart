import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/workout/workout_notifier.dart';

class FitnessSummary extends ConsumerWidget {
  const FitnessSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutNotifier = ref.watch(workoutNotifierProvider.notifier);
    final totalCalories = workoutNotifier.totalCaloriesBurned;
    final totalMinutes = workoutNotifier.totalMinutesWorkedOut;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fitness Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(
                  icon: Icons.local_fire_department,
                  value: '$totalCalories',
                  label: 'Calories',
                ),
                _SummaryItem(
                  icon: Icons.timer,
                  value: '$totalMinutes',
                  label: 'Minutes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(label),
      ],
    );
  }
} 
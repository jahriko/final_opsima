import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/presentation/home/widgets/fitness_summary.dart';
import 'package:tla_1_2_opsima/presentation/home/widgets/workout_list.dart';
import 'package:tla_1_2_opsima/presentation/home/widgets/theme_toggle.dart';
import 'package:tla_1_2_opsima/presentation/workout/workout_timer.dart';
import 'package:tla_1_2_opsima/presentation/goals/goals_screen.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';
import 'package:tla_1_2_opsima/application/workout/workout_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fitness Tracker'),
          actions: const [
            ThemeToggle(),
            SizedBox(width: 16),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Workouts'),
              Tab(text: 'Goals'),
              Tab(text: 'Timer'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _WorkoutsTab(),
            GoalsScreen(),
            _TimerTab(),
          ],
        ),
      ),
    );
  }
}

class _WorkoutsTab extends ConsumerWidget {
  const _WorkoutsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const FitnessSummary(),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => _showAddWorkoutDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Add Workout'),
        ),
        const SizedBox(height: 16),
        const WorkoutList(),
      ],
    );
  }

  Future<void> _showAddWorkoutDialog(
      BuildContext context, WidgetRef ref) async {
    final formKey = GlobalKey<FormState>();
    String name = '';
    int duration = 0;
    int calories = 0;
    WorkoutType type = WorkoutType.other;

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Workout'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Workout Name',
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Name is required' : null,
                onSaved: (value) => name = value ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) => int.tryParse(value ?? '') == null
                    ? 'Invalid duration'
                    : null,
                onSaved: (value) => duration = int.parse(value ?? '0'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Calories Burned',
                ),
                keyboardType: TextInputType.number,
                validator: (value) => int.tryParse(value ?? '') == null
                    ? 'Invalid calories'
                    : null,
                onSaved: (value) => calories = int.parse(value ?? '0'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<WorkoutType>(
                decoration: const InputDecoration(
                  labelText: 'Workout Type',
                ),
                value: type,
                items: WorkoutType.values
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        ))
                    .toList(),
                onChanged: (value) => type = value ?? WorkoutType.other,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();
                final workout = Workout(
                  id: DateTime.now().toIso8601String(),
                  name: name,
                  durationMinutes: duration,
                  caloriesBurned: calories,
                  date: DateTime.now(),
                  type: type,
                );
                ref.read(workoutNotifierProvider.notifier).addWorkout(workout);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _TimerTab extends StatelessWidget {
  const _TimerTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: WorkoutTimer(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/workout/workout_notifier.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';

class AddWorkoutButton extends ConsumerWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _showAddWorkoutDialog(context, ref),
      child: const Icon(Icons.add),
    );
  }

  Future<void> _showAddWorkoutDialog(BuildContext context, WidgetRef ref) async {
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
                validator: (value) =>
                    int.tryParse(value ?? '') == null ? 'Invalid duration' : null,
                onSaved: (value) => duration = int.parse(value ?? '0'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Calories Burned',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    int.tryParse(value ?? '') == null ? 'Invalid calories' : null,
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
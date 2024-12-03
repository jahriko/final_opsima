import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/goal/goal_notifier.dart';
import 'package:tla_1_2_opsima/domain/goal/workout_goal.dart';

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalNotifier = ref.watch(goalNotifierProvider.notifier);
    final activeGoals = goalNotifier.activeGoals;
    final completedGoals = goalNotifier.completedGoals;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        FilledButton.icon(
          onPressed: () => _showAddGoalDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Add Goal'),
        ),
        const SizedBox(height: 24),
        _GoalList(goals: activeGoals),
        const SizedBox(height: 24),
        Text(
          'Completed Goals',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _GoalList(goals: completedGoals),
      ],
    );
  }

  Future<void> _showAddGoalDialog(BuildContext context, WidgetRef ref) async {
    final formKey = GlobalKey<FormState>();
    String title = '';
    int targetCalories = 0;
    int targetMinutes = 0;
    DateTime deadline = DateTime.now().add(const Duration(days: 7));

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Goal'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Goal Title',
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Title is required' : null,
                onSaved: (value) => title = value ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Target Calories',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    int.tryParse(value ?? '') == null ? 'Invalid calories' : null,
                onSaved: (value) => targetCalories = int.parse(value ?? '0'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Target Minutes',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    int.tryParse(value ?? '') == null ? 'Invalid minutes' : null,
                onSaved: (value) => targetMinutes = int.parse(value ?? '0'),
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
                final goal = WorkoutGoal.create(
                  title: title,
                  targetCalories: targetCalories,
                  targetMinutes: targetMinutes,
                  deadline: deadline,
                );
                ref.read(goalNotifierProvider.notifier).addGoal(goal);
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

class _GoalList extends StatelessWidget {
  final List<WorkoutGoal> goals;

  const _GoalList({required this.goals});

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return const Center(
        child: Text('No goals yet'),
      );
    }

    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _GoalProgress(
                  label: 'Calories',
                  current: goal.currentCalories,
                  target: goal.targetCalories,
                ),
                const SizedBox(height: 8),
                _GoalProgress(
                  label: 'Minutes',
                  current: goal.currentMinutes,
                  target: goal.targetMinutes,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GoalProgress extends StatelessWidget {
  final String label;
  final int current;
  final int target;

  const _GoalProgress({
    required this.label,
    required this.current,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target > 0 ? current / target : 0.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $current / $target'),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
} 
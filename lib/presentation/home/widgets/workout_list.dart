import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tla_1_2_opsima/application/workout/workout_notifier.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';

class WorkoutList extends ConsumerWidget {
  const WorkoutList({
    super.key,
    this.filterType,
  });

  final WorkoutType? filterType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutNotifierProvider);
    
    final filteredWorkouts = filterType == null 
        ? workouts 
        : workouts.where((w) => w.type == filterType).toList();

    if (filteredWorkouts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              filterType == null 
                  ? 'No workouts yet' 
                  : 'No ${filterType?.name} workouts',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredWorkouts.length,
      itemBuilder: (context, index) {
        final workout = filteredWorkouts[index];
        return WorkoutCard(workout: workout);
      },
    );
  }
}

class WorkoutCard extends ConsumerWidget {
  const WorkoutCard({
    super.key,
    required this.workout,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Dismissible(
      key: Key(workout.id),
      onDismissed: (_) {
        ref.read(workoutNotifierProvider.notifier).removeWorkout(workout.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Workout deleted'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                ref.read(workoutNotifierProvider.notifier).addWorkout(workout);
              },
            ),
          ),
        );
      },
      background: Container(
        color: theme.colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.onError,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: Icon(
            _getIconForType(workout.type),
            color: theme.colorScheme.primary,
          ),
          title: Text(workout.name),
          subtitle: Text(
            '${workout.durationMinutes} mins • ${workout.caloriesBurned} calories',
          ),
          trailing: Text(
            _formatDate(workout.date),
            style: theme.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(WorkoutType type) {
    switch (type) {
      case WorkoutType.running:
        return Icons.directions_run;
      case WorkoutType.cycling:
        return Icons.directions_bike;
      case WorkoutType.swimming:
        return Icons.pool;
      case WorkoutType.weightLifting:
        return Icons.fitness_center;
      case WorkoutType.yoga:
        return Icons.self_improvement;
      case WorkoutType.other:
        return Icons.sports;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
} 
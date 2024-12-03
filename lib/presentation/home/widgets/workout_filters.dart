import 'package:flutter/material.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';

class WorkoutFilters extends StatelessWidget {
  const WorkoutFilters({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final WorkoutType? selectedType;
  final Function(WorkoutType?) onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: selectedType == null,
            onSelected: (_) => onTypeSelected(null),
          ),
          const SizedBox(width: 8),
          ...WorkoutType.values.map(
            (type) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(type.name),
                selected: selectedType == type,
                onSelected: (_) => onTypeSelected(type),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
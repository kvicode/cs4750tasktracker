import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTap;
  final Function(BuildContext)? deleteTap;


  const TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.settingsTap,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: settingsTap,
                backgroundColor: Colors.grey.shade900,
                icon: Icons.settings,
                borderRadius: BorderRadius.circular(16),
              ),

             SlidableAction(
               onPressed: deleteTap,
               backgroundColor: Colors.red,
               icon: Icons.delete,
               borderRadius: BorderRadius.circular(16),
             ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [

                Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                ),
                Text(taskName),
              ],
            ),
          ),
        )
    );
  }
}
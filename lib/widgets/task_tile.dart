import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/circle_container.dart';
import '../data/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?)? onComplete;

  const TaskTile({Key? key, required this.task, this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(
              backgroundOpacity,
            ),
            child: Center(
              child: Icon(task.category.icon, color: task.category.color.withOpacity(iconOpacity),),
            ),
          ),
          16.horizontalSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: fontWeight,
                    decoration: textDecoration,
                  ),
                ),
                Text(
                  task.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onComplete)
        ],
      ),
    );
  }
}

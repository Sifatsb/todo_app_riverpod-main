import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/task_details.dart';
import 'package:todo_app_riverpod/widgets/task_tile.dart';

import '../data/models/task.dart';
import 'common_container.dart';

class DisplayListOfTask extends StatelessWidget {
  DisplayListOfTask({
    Key? key,
    required this.tasks,
    this.isCompletedTask = false,
  }) : super(key: key);

  final List<Task> tasks;
  final bool isCompletedTask;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompletedTask
        ? 'There is no completed task yet'
        : 'There is no task todo!';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {},
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return TaskDetails(task: task);
                        },
                      );
                    },
                    child: TaskTile(task: task));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_riverpod/config/routes/route_location.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/providers/providers.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/display_list_of_task.dart';
import 'package:todo_app_riverpod/widgets/display_white_text.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskSate = ref.watch(taskProvider);
    final selectedDate = ref.watch(dateProvider);

    final completeTask = _completedTasks(taskSate.tasks, ref);
    final inCompleteTask = _inCompletedTasks(taskSate.tasks, ref);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: deviceSize.width,
                height: deviceSize.height * 0.3,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    30.verticalSpacing,
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(selectedDate),
                        size: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    10.verticalSpacing,
                    const DisplayWhiteText(
                      text: 'My Todo List',
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(
                      tasks: inCompleteTask,
                    ),
                    20.verticalSpacing,
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    10.verticalSpacing,
                    DisplayListOfTask(
                      tasks: completeTask,
                      isCompletedTask: true,
                    ),
                    20.verticalSpacing,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        child: const DisplayWhiteText(
                          text: 'Add New Task',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
  }

  List<Task> _inCompletedTasks(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }


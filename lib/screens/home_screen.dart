import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/config/routes/route_location.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/display_list_of_task.dart';
import 'package:todo_app_riverpod/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
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
                    const DisplayWhiteText(
                      text: 'Aug 7, 2023',
                      size: 20,
                      fontWeight: FontWeight.normal,
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
                      tasks: const [
                        Task(
                          title: 'Learn Riverpod',
                          time: '10:20',
                          date: 'Sep 20, 2023',
                          note: 'Note Done',
                          isCompleted: false,
                          category: TaskCategory.education,
                        ),
                        Task(
                          title: 'Learn Riverpod',
                          time: '10:20',
                          date: 'Sep 20, 2023',
                          note: 'Note Done',
                          isCompleted: false,
                          category: TaskCategory.home,
                        ),
                      ],
                    ),
                    20.verticalSpacing,
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    10.verticalSpacing,
                    DisplayListOfTask(
                      tasks: const [
                        Task(
                          title: 'Learn Riverpod',
                          time: '10:20',
                          date: 'Sep 20, 2023',
                          note: 'Note Done',
                          isCompleted: true,
                          category: TaskCategory.education,
                        ),
                        Task(
                          title: 'Learn Riverpod',
                          time: '10:20',
                          date: 'Sep 20, 2023',
                          note: 'Note Done',
                          isCompleted: true,
                          category: TaskCategory.home,
                        ),
                      ],
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
}

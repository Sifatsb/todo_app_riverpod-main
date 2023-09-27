import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_riverpod/config/routes/route_location.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/providers/date_providers.dart';
import 'package:todo_app_riverpod/providers/providers.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/common_text_field.dart';
import 'package:todo_app_riverpod/widgets/display_white_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/select_category.dart';
import '../widgets/select_date_time.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task Title',
                hintText: 'Task Title',
                controller: _titleController,
              ),
              20.verticalSpacing,
              const SelectCategory(),
              20.verticalSpacing,
              const SelectDateTime(),
              20.verticalSpacing,
              CommonTextField(
                title: 'Note',
                hintText: 'Task Note',
                maxLines: 6,
                controller: _noteController,
              ),
              16.verticalSpacing,
              ElevatedButton(
                onPressed: _createTask,
                child: const DisplayWhiteText(
                  text: 'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text;
    final note = _noteController.text;
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).createTask(task).then(
            (value) => context.go(RouteLocation.home),
          );
    }
  }
}

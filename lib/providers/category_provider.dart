import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/utils/task_category.dart';

final categoryProvider = StateProvider<TaskCategory>((ref) => TaskCategory.others);
import 'package:todo_app_riverpod/data/data.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> getAllTasks();
}
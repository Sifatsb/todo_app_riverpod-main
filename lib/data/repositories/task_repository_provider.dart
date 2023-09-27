import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/data/data.dart';

final taskRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(taskDataSourceProvider);
  return TaskRepositoryImpl(dataSource);
},);
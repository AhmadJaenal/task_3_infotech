import 'package:flutter/material.dart';
import 'package:task_3_infotech/app/common/utils/task_enum.dart';
import 'package:task_3_infotech/app/modules/home/model/todo_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  TaskFilter _filter = TaskFilter.all;

  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  TaskFilter get filter => _filter;

  List<TaskModel> get filteredTasks {
    switch (_filter) {
      case TaskFilter.completed:
        return _tasks.where((task) => task.isCompleted).toList();

      case TaskFilter.pending:
        return _tasks.where((task) => !task.isCompleted).toList();

      case TaskFilter.all:
        return _tasks;
    }
  }

  void changeFilter(TaskFilter filter) {
    if (_filter == filter) return;

    _filter = filter;
    notifyListeners();
  }

  void addTask({
    required String description,
    required String category,
    required Color color,
    DateTime? date,
  }) {
    final text = description.trim();

    if (text.isEmpty) return;

    _tasks.insert(
      0,
      TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        description: text,
        category: category,
        color: color,
        date: date ?? DateTime.now(),
        isCompleted: false,
      ),
    );

    notifyListeners();
  }

  void toggleStatus(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    final task = _tasks[index];

    _tasks[index] = task.copyWith(isCompleted: !task.isCompleted);

    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);

    notifyListeners();
  }

  void clearAllTask() {
    _tasks.clear();

    notifyListeners();
  }

  int get totalTask => _tasks.length;

  int get completedTask => _tasks.where((task) => task.isCompleted).length;

  int get pendingTask => _tasks.where((task) => !task.isCompleted).length;
}

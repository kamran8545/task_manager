import '../models/task_model.dart';

class Tasks {
  final List<TaskModel> _tasks = [];

  bool addTask({required TaskModel taskModel}) {
    try {
      _tasks.add(taskModel);
      return true;
    } catch (_) {
      return false;
    }
  }

  bool deleteTask({required String id}) {
    try {
      _tasks.removeWhere((element) => element.taskId == id);
      return true;
    } catch (_) {
      return false;
    }
  }

  List<TaskModel> fetchTasks() => _tasks;

  bool isEmpty() => _tasks.isEmpty;

  int size() => _tasks.length;
}

import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';

class TaskModel {
  String taskId = '';
  String taskName = '';
  String taskDescription = '';

  TaskModel.empty();

  TaskModel({required this.taskId, required this.taskName, required this.taskDescription});

  factory TaskModel.fromCreateTaskUseCaseParam({required CreateTaskUseCaseParam param}) {
    return TaskModel(taskId: param.taskId, taskName: param.taskName, taskDescription: param.taskDescription);
  }
}

import 'package:task_manager_app/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/tasks.dart';

class LocalDataSourceImp extends LocalDataSource {
  final Tasks _tasks;

  LocalDataSourceImp({required Tasks tasks}) : _tasks = tasks;

  @override
  Future<bool> createTask(CreateTaskUseCaseParam param) async {
    return _tasks.addTask(taskModel: TaskModel.fromCreateTaskUseCaseParam(param: param));
  }

  @override
  Future<bool> deleteTask(String taskId) async {
    return _tasks.deleteTask(id: taskId);
  }

  @override
  Future<List<TaskModel>> fetchTasks() async {
    return _tasks.fetchTasks();
  }
}

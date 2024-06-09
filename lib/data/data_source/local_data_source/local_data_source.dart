import '../../../domain/usecases/task_usecase/create_task_usecase.dart';
import '../../../models/task_model.dart';

abstract class LocalDataSource {
  /// This method will create a new task
  /// Input : [params] contains task title
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [bool] false
  Future<bool> createTask(CreateTaskUseCaseParam param);

  /// This method will delete a task
  /// Input : [String] contains task id
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [bool] false
  Future<bool> deleteTask(String taskId);

  /// This method will fetch all the tasks
  /// Output : if operation successful returns [List<TaskModel>]
  /// if unsuccessful the response will be empty list
  Future<List<TaskModel>> fetchTasks();
}

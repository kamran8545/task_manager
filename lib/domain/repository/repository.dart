import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/models/task_model.dart';

import '../../utils/custom_failures.dart';
import '../../utils/result.dart';

abstract class Repository {
  /// This method will create a new task
  /// Input : [params] contains task title
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, bool>> createTask(CreateTaskUseCaseParam param);

  /// This method will delete a task
  /// Input : [String] contains task id
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, bool>> deleteTask(String taskId);

  /// This method will fetch all the tasks
  /// Output : if operation successful returns [List<TaskModel>]
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, List<TaskModel>>> fetchTasks();
}

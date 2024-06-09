import 'package:task_manager_app/data/data_source/local_data_source/local_data_source.dart';
import 'package:task_manager_app/domain/repository/repository.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/custom_failures.dart';
import 'package:task_manager_app/utils/result.dart';

class RepositoryImp extends Repository {
  final LocalDataSource _localDataSource;

  RepositoryImp({required LocalDataSource localDataSource}) : _localDataSource = localDataSource;

  @override
  Future<Result<CustomFailure, bool>> createTask(CreateTaskUseCaseParam param) async {
    bool response = await _localDataSource.createTask(param);
    return Success(successRes: response);

    /// Custom Failure will be returned when there is
    /// Server failure
    /// Network failure
    /// Auth failure
  }

  @override
  Future<Result<CustomFailure, bool>> deleteTask(String taskId) async {
    bool response = await _localDataSource.deleteTask(taskId);
    return Success(successRes: response);

    /// Custom Failure will be returned when there is
    /// Server failure
    /// Network failure
    /// Auth failure
  }

  @override
  Future<Result<CustomFailure, List<TaskModel>>> fetchTasks() async {
    List<TaskModel> response = await _localDataSource.fetchTasks();
    return Success(successRes: response);

    /// Custom Failure will be returned when there is
    /// Server failure
    /// Network failure
    /// Auth failure
  }
}

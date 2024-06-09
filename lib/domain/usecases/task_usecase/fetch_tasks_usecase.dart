import 'package:task_manager_app/models/task_model.dart';

import '../../../utils/custom_failures.dart';
import '../../../utils/result.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

class FetchTasksUseCase extends UseCase<List<TaskModel>, NoParams> {
  final Repository repository;

  FetchTasksUseCase(this.repository);

  @override
  Future<Result<CustomFailure, List<TaskModel>>> call(NoParams params) {
    return repository.fetchTasks();
  }
}

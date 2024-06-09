import '../../../utils/custom_failures.dart';
import '../../../utils/result.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

class DeleteTaskUseCase extends UseCase<bool, String> {
  final Repository repository;

  DeleteTaskUseCase(this.repository);

  @override
  Future<Result<CustomFailure, bool>> call(String taskId) {
    return repository.deleteTask(taskId);
  }
}

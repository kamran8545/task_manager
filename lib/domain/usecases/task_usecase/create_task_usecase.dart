import 'package:equatable/equatable.dart';
import 'package:task_manager_app/models/task_model.dart';

import '../../../utils/custom_failures.dart';
import '../../../utils/result.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

class CreateTaskUseCase extends UseCase<bool, CreateTaskUseCaseParam> {
  final Repository repository;

  CreateTaskUseCase(this.repository);

  @override
  Future<Result<CustomFailure, bool>> call(CreateTaskUseCaseParam params) async {
    return repository.createTask(params);
  }
}

class CreateTaskUseCaseParam extends Equatable {
  final String taskId;
  final String taskName;
  final String taskDescription;

  const CreateTaskUseCaseParam({required this.taskId, required this.taskName, required this.taskDescription});

  factory CreateTaskUseCaseParam.copyFromTaskModel({required TaskModel taskModel}) {
    return CreateTaskUseCaseParam(taskId: taskModel.taskId, taskName: taskModel.taskName, taskDescription: taskModel.taskDescription);
  }

  @override
  List<Object?> get props => [taskId, taskName, taskDescription];
}

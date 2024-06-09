import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/data/data_source/local_data_source/local_data_source_imp.dart';
import 'package:task_manager_app/data/repository_imp/repository_imp.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/result.dart';
import 'package:task_manager_app/utils/tasks.dart';

void main() {
  test('Create Task', () async {
    TaskModel taskModel = TaskModel(taskId: '13sv', taskName: "Test Task", taskDescription: "Test task description");
    var resp = await CreateTaskUseCase(
      RepositoryImp(
        localDataSource: LocalDataSourceImp(
          tasks: Tasks(),
        ),
      ),
    ).call(
      CreateTaskUseCaseParam.copyFromTaskModel(taskModel: taskModel),
    );
    var parseResult = resp as Success;
    expect(parseResult.successRes, true);
  });
}

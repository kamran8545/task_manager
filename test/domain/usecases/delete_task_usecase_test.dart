import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/data/data_source/local_data_source/local_data_source_imp.dart';
import 'package:task_manager_app/data/repository_imp/repository_imp.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/delete_task_usecase.dart';
import 'package:task_manager_app/models/task_model.dart';
import 'package:task_manager_app/utils/result.dart';
import 'package:task_manager_app/utils/tasks.dart';

void main() {
  test('Delete task test', () async {
    TaskModel taskModel = TaskModel(taskId: '13sv', taskName: "Test Task1", taskDescription: "Test task description1");
    TaskModel taskModel1 = TaskModel(taskId: '131v', taskName: "Test Task2", taskDescription: "Test task description2");
    TaskModel taskModel2 = TaskModel(taskId: '132v', taskName: "Test Task3", taskDescription: "Test task description3");
    TaskModel taskModel3 = TaskModel(taskId: '133v', taskName: "Test Task4", taskDescription: "Test task description4");
    TaskModel taskModel4 = TaskModel(taskId: '134v', taskName: "Test Task5", taskDescription: "Test task description5");
    TaskModel taskModel5 = TaskModel(taskId: '135v', taskName: "Test Task6", taskDescription: "Test task description6");

    Tasks tasks = Tasks()
      ..addTask(taskModel: taskModel)
      ..addTask(taskModel: taskModel1)
      ..addTask(taskModel: taskModel2)
      ..addTask(taskModel: taskModel3)
      ..addTask(taskModel: taskModel4)
      ..addTask(taskModel: taskModel5);
    var resp = await DeleteTaskUseCase(
      RepositoryImp(
        localDataSource: LocalDataSourceImp(
          tasks: tasks,
        ),
      ),
    ).call(taskModel.taskId);
    var parseResult = resp as Success;
    expect(parseResult.successRes, true);
  });
}

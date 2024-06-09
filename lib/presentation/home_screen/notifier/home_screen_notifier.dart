import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/domain/usecases/usecase.dart';
import 'package:task_manager_app/utils/result.dart';

import '../../../domain/usecases/task_usecase/delete_task_usecase.dart';
import '../../../domain/usecases/task_usecase/fetch_tasks_usecase.dart';
import '../../../models/task_model.dart';

final homeScreenNotifierProvider = ChangeNotifierProvider((ref) => GetIt.I.get<HomeScreenNotifier>());

class HomeScreenNotifier extends ChangeNotifier {
  CreateTaskUseCase _createTaskUseCase;
  DeleteTaskUseCase _deleteTaskUseCase;
  FetchTasksUseCase _fetchTasksUseCase;

  HomeScreenNotifier({
    required CreateTaskUseCase createTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
    required FetchTasksUseCase fetchTasksUseCase,
  })  : _createTaskUseCase = createTaskUseCase,
        _deleteTaskUseCase = deleteTaskUseCase,
        _fetchTasksUseCase = fetchTasksUseCase;

  List<TaskModel> tasks = [];
  bool isLoading = false;

  void onInit() async {
    fetchTasks();
  }

  void fetchTasks() async {
    isLoading = true;
    var resp = await _fetchTasksUseCase.call(NoParams());
    switch (resp) {
      case Success(successRes: final response):
        tasks = response;
        break;
      case Failure(failureRes: final failure):
        break;
    }
    isLoading = false;
    notifyListeners();
  }

  void addTask({required TaskModel taskModel}) async {
    await _createTaskUseCase.call(CreateTaskUseCaseParam.copyFromTaskModel(taskModel: taskModel));
    fetchTasks();
  }

  void deleteTask({required String taskId}) async {
    await _deleteTaskUseCase.call(taskId);
    fetchTasks();
  }
}

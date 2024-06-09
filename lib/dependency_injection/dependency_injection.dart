import 'package:get_it/get_it.dart';
import 'package:task_manager_app/data/data_source/local_data_source/local_data_source_imp.dart';
import 'package:task_manager_app/data/repository_imp/repository_imp.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/create_task_usecase.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/delete_task_usecase.dart';
import 'package:task_manager_app/domain/usecases/task_usecase/fetch_tasks_usecase.dart';

import '../data/data_source/local_data_source/local_data_source.dart';
import '../domain/repository/repository.dart';
import '../presentation/home_screen/notifier/home_screen_notifier.dart';
import '../utils/tasks.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Tasks>(() => Tasks());
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(tasks: sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImp(localDataSource: sl()));
  sl.registerLazySingleton<CreateTaskUseCase>(() => CreateTaskUseCase(sl()));
  sl.registerLazySingleton<DeleteTaskUseCase>(() => DeleteTaskUseCase(sl()));
  sl.registerLazySingleton<FetchTasksUseCase>(() => FetchTasksUseCase(sl()));
  sl.registerLazySingleton<HomeScreenNotifier>(
    () => HomeScreenNotifier(
      createTaskUseCase: sl(),
      deleteTaskUseCase: sl(),
      fetchTasksUseCase: sl(),
    ),
  );
}

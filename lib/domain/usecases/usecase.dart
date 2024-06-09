import 'package:equatable/equatable.dart';

import '../../utils/custom_failures.dart';
import '../../utils/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<CustomFailure, Type>> call(Params params);
}

abstract class InstantUseCase<Type, Params> {
  Result<CustomFailure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

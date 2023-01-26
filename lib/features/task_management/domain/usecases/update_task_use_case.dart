import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/core/usecase/usecase.dart';
import 'package:todos_app/features/task_management/domain/entities/params/update_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';
import 'package:todos_app/features/task_management/domain/repositories/task_repository.dart';

class UpdateTaskUseCase implements UseCase<List<TaskEntity>, UpdateTaskParam> {
  UpdateTaskUseCase(this.taskRepository);
  final TaskRepository taskRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(UpdateTaskParam param) {
    return taskRepository.updateTask(param);
  }
}

import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/core/usecase/usecase.dart';
import 'package:todos_app/features/task_management/domain/entities/params/get_tasks_param.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';
import 'package:todos_app/features/task_management/domain/repositories/task_repository.dart';

class GetTasksByStatusUseCase
    implements UseCase<List<TaskEntity>, GetTasksParam?> {
  GetTasksByStatusUseCase(this.taskRepository);
  final TaskRepository taskRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(GetTasksParam? param) {
    return taskRepository.getTasksByStatus(param);
  }
}

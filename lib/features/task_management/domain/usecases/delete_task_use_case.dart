import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/core/usecase/usecase.dart';
import 'package:todos_app/features/task_management/domain/entities/params/delete_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';
import 'package:todos_app/features/task_management/domain/repositories/task_repository.dart';

class DeleteTaskUseCase implements UseCase<List<TaskEntity>, DeleteTaskParam> {
  DeleteTaskUseCase(this.taskRepository);
  final TaskRepository taskRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(DeleteTaskParam param) {
    return taskRepository.deleteTasks(param);
  }
}

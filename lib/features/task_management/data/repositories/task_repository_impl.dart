import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/features/task_management/data/datasources/task_data_source.dart';
import 'package:todos_app/features/task_management/domain/entities/params/add_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/delete_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/get_tasks_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/update_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';
import 'package:todos_app/features/task_management/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl(this.dataSource);
  final TaskDataSource dataSource;

  @override
  Future<Either<Failure, List<TaskEntity>>> addTask(AddTaskParam param) async {
    try {
      final updatedTaskList = await dataSource.addTask(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(
        TaskFailure('Failed to add task'),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> deleteTasks(
    DeleteTaskParam param,
  ) async {
    try {
      final updatedTaskList = await dataSource.deleteTasks(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(
        TaskFailure('Failed to Delete task'),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> updateTask(
    UpdateTaskParam param,
  ) async {
    try {
      final updatedTaskList = await dataSource.editTask(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(
        TaskFailure('Failed to get tasks'),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksByStatus(
    GetTasksParam? param,
  ) async {
    try {
      final updatedTaskList = await dataSource.getTasks(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(
        TaskFailure('Failed to get tasks'),
      );
    }
  }
}

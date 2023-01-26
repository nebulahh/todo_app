import 'package:todos_app/core/services/task_storage_service.dart';
import 'package:todos_app/features/task_management/domain/entities/params/add_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/delete_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/get_tasks_param.dart';
import 'package:todos_app/features/task_management/domain/entities/params/update_task_param.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';

abstract class TaskDataSource {
  Future<List<TaskEntity>> addTask(AddTaskParam param);
  Future<List<TaskEntity>> getTasks(GetTasksParam? param);
  Future<List<TaskEntity>> editTask(UpdateTaskParam param);
  Future<List<TaskEntity>> deleteTasks(DeleteTaskParam param);
}

class LocalTaskDataSourceImpl implements TaskDataSource {
  const LocalTaskDataSourceImpl(this.taskStorageService);
  final TaskStorageService taskStorageService;

  @override
  Future<List<TaskEntity>> addTask(AddTaskParam param) async {
    return taskStorageService.addTask(
      TaskEntity(
        title: param.title,
        description: param.description,
        seconds: 0,
        status: TaskStatus.todo,
      ),
    );
  }

  @override
  Future<List<TaskEntity>> getTasks(GetTasksParam? param) async {
    final tasks = await taskStorageService.getTasks();
    if (param == null) {
      return tasks;
    }
    return tasks.where((element) => element.status == param.status).toList();
  }

  @override
  Future<List<TaskEntity>> deleteTasks(DeleteTaskParam param) async {
    return taskStorageService.deleteTask(param.task);
  }

  @override
  Future<List<TaskEntity>> editTask(UpdateTaskParam param) async {
    return taskStorageService.editTask(param.oldTask, param.newTask);
  }
}

import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.title,
    required super.description,
    required super.seconds,
    required super.completedAt,
    required super.status,
  });
}

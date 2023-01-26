import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';

class GetTasksParam {
  const GetTasksParam({required this.status});
  final TaskStatus status;

  Map<String, dynamic> toJson() => {
        'status': status,
      };
}

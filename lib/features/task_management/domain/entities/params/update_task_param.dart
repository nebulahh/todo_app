import 'package:equatable/equatable.dart';
import 'package:todos_app/features/task_management/domain/entities/task_entity.dart';

class UpdateTaskParam extends Equatable {
  const UpdateTaskParam({required this.oldTask, required this.newTask});

  final TaskEntity oldTask;
  final TaskEntity newTask;
  Map<String, dynamic> toJson() => {
        'oldTask': oldTask,
        'newTask': newTask,
      };

  @override
  List<Object?> get props => [
        oldTask,
        newTask,
      ];
}

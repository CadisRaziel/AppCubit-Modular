// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jobtimer/app/modules/entities/project_task.dart';

class ProjectTaskModel {
  //!Task model referente ao Project task
  int? id;
  String name;
  int duration;
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
      id: task.id,
      name: task.name,
      duration: task.duration,
    );
  }
}

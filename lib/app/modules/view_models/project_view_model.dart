// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:jobtimer/app/modules/entities/project.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/view_models/project_task_model.dart';

class ProjectViewModel {
  int? id;
  final String? name;
  final int? estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
  ProjectViewModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

   


  factory ProjectViewModel.fromEntity(Project project) {

    //O isar nao traz os filhos no select, ele tras o objetos principal (somente os dados do projeto) com isso eu nao conseguiria fazer as 'tasks' ser carregada
    //Para isso eu faço o passo abaixo
    project.tasks.loadSync();

    return ProjectViewModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.tasks.map((e) => ProjectTaskModel.fromEntity(e)).toList(),
    );
  }
}

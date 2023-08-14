// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jobtimer/app/modules/entities/project.dart';
import 'package:jobtimer/app/modules/repositories/projects/project_repository.dart';
import 'package:jobtimer/app/modules/services/projects/project_service.dart';
import 'package:jobtimer/app/modules/view_models/project_view_model.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;
  ProjectServiceImpl({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectViewModel projectModel) async {
    //? Aqui vamos pegar nossa viewModel e transformar em uma entidade
    final project = Project()
      // project.id = projectModel.id;
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

      await _projectRepository.register(project);
      //!A exeção a gente trata dentro da controller
  }
}

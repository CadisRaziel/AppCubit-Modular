import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/services/projects/project_service.dart';
import 'package:jobtimer/app/modules/view_models/project_view_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  final ProjectService _projectService;

  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final projectModel = ProjectViewModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: [],
      );
      await _projectService.register(projectModel);
      emit(ProjectRegisterStatus.success);

      ///testar o botão
      //  await Future.delayed(const Duration(seconds: 2));
      // // await _projectService.register(projectModel);
      // emit(ProjectRegisterStatus.success);
    } catch (e, s) {
      log("Erro ao salvar o projeto", error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}

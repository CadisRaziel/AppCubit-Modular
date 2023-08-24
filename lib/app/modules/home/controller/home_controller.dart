import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/services/projects/project_service.dart';
import 'package:jobtimer/app/modules/view_models/project_view_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects =
          await _projectService.findByStatus(state.projectStatusFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch (e, s) {
      log("Erro ao buscar os projetos", error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filterDropDown(ProjectStatus status) async {
    emit(state.copyWith(status: HomeStatus.loading, projects: [])); // projects: [] -> para limpar os projetos de um determinado status para mostrar outra lista de outro status
    final projects = await _projectService.findByStatus(status);
    emit(state.copyWith(status: HomeStatus.complete, projects: projects, projectStatusFilter: status));
  }
}

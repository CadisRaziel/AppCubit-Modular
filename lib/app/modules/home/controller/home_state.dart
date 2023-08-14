// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  complete,
  failure,
}

class HomeState extends Equatable {
  final List<ProjectViewModel> projects;
  final HomeStatus status;
  final ProjectStatus projectStatusFilter;

  HomeState._({
    required this.projects,
    required this.status,
    required this.projectStatusFilter,
  });

  HomeState.initial()
      : this._(
          projects: [],
          projectStatusFilter: ProjectStatus.em_andamento,
          status: HomeStatus.initial,
        );

  @override
  List<Object?> get props => [projects, status, projectStatusFilter];

  HomeState copyWith({
    List<ProjectViewModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectStatusFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectStatusFilter: projectStatusFilter ?? this.projectStatusFilter,
    );
  }
}

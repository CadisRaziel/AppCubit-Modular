import 'package:jobtimer/app/modules/entities/project.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status);
}
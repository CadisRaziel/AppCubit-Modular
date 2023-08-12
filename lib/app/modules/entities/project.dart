import 'package:isar/isar.dart';
import 'package:jobtimer/app/modules/entities/converters/project_status_converter.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String? name;

  //*Não conseguimos converter ENUM diretamente pro isar, pra isso temos que criar um conversor para ele pegar o dado da tabela e transformar em um enum
  @ProjectStatusConverter() //*Aqui eu utilizo o conversor que eu criei
  late ProjectStatus status;

  //*IsarLink -> OneToMany
  //*Um projeto pode ter varias tasks
  final tasks = IsarLink<ProjectTask>();
}


import 'package:isar/isar.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';


//*TypeConverter<ProjectStatus, int> -> vai converter um projectStatus para um int (porque um inteiro ? o enum tem um indice !!, pelo indice consigo saber se é em_andamento ou finalizado, no banco de dados ele vai coloca 0,1)
class ProjectStatusConverter extends TypeConverter<ProjectStatus, int>{
  
  const ProjectStatusConverter();
  
  @override
  ProjectStatus fromIsar(int object) {
      //*Vai converter o nosso valor que ta dentro do isar(banco de dados) para um projectStatus
      return ProjectStatus.values[object];
      //? 0 -> em_andamento
      //? 1 -> finalizado
    }
  
    @override
    int toIsar(ProjectStatus object) {
    //*Vai recebo um projectStatus e vou gravar no isar(banco de dados)
    return object.index;
  }
  
}
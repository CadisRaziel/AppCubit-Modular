import 'package:jobtimer/app/modules/view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectViewModel projectModel); //Aqui passamos o mesmo que seria um DTO no java !!
}


//? Aqui vamos crair 'viewModel' classes de modelo que vai vim da nossa controller e vai passar para nosso service
//? por isso aqui não pasamos um Project como parametro
//? pois a entidade(model) fica entre o service e o repository
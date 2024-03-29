import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:jobtimer/app/modules/project/register/project_register_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProjectRegisterModule extends Module {
  @override
  List<Bind> get binds => [
    //!Passando um bloc como module
    BlocBind.lazySingleton((i) => ProjectRegisterController(projectService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',   child: (context, args) => ProjectRegisterPage(controller: Modular.get())), //! Quando eu passo por parametro eu busco a instancia assim !  
  ];
}

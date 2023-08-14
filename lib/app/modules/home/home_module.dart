import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/home/controller/home_controller.dart';
import 'package:jobtimer/app/modules/home/home_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => HomeController(projectService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    //!Como eu nao quero transformar a pagina em statefulWIdget da home_page, eu posso implementar interações do bloc diretamente aqui
    //!Com isso eu evito um initState
    //!Aqui farei um ouvinte do loading
    ChildRoute('/', child: (context,args)  {
        final controller = Modular.get<HomeController>()..loadProjects(); //*Antes de carrega minha tela eu chamo o loadProject (que é o status Loading da homeState)
        return HomePage(controller: controller);
    })
  ];
}

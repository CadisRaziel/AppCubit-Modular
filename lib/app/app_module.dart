import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/core/database/database.dart';
import 'package:jobtimer/app/modules/core/database/database_impl.dart';
import 'package:jobtimer/app/modules/home/home_module.dart';
import 'package:jobtimer/app/modules/login/login_module.dart';
import 'package:jobtimer/app/modules/project/project_module.dart';
import 'package:jobtimer/app/modules/repositories/projects/project_repository.dart';
import 'package:jobtimer/app/modules/repositories/projects/project_repository_impl.dart';
import 'package:jobtimer/app/modules/services/auth/auth_service.dart';
import 'package:jobtimer/app/modules/services/auth/auth_service_impl.dart';
import 'package:jobtimer/app/modules/services/projects/project_service.dart';
import 'package:jobtimer/app/modules/services/projects/project_service_impl.dart';
import 'package:jobtimer/app/modules/splash/splash_page.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    //*Todas as instancias que forem usadas mais de um local sera incluido aqui no bind
    //? Repare que esta em uma ordem: o ultimo sempre vai dependenr do anti penultimo e assim por diante (ou outra forma que voce fizer, porém lembre-se se o Database precisa do AuthService, o database vai depois que o AuthService)
    //? Porém o modular tem uma peculiaridade que nao precisa estar na ordem.
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton<Database>((i) => DatabaseImpl()),
    Bind.lazySingleton<ProjectRepository>((i) => ProjectRepositoryImpl(database: i())),
    Bind.lazySingleton<ProjectService>((i) => ProjectServiceImpl(projectRepository: i())),

  ];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute('/', child: (_, __) => Container());
    ChildRoute('/', child: (context, args) => const SplashPage()), //*-> Para adicionar uma nova página
    ModuleRoute('/login', module: LoginModule()), //*-> Para adicionar um novo módulo (como nosso modulo de login)
    ModuleRoute('/home', module: HomeModule()), //*-> Para adicionar um novo módulo (como nosso modulo de login)
    ModuleRoute('/project', module: ProjectModule()), //*-> Para adicionar um novo módulo (como nosso modulo de login)
  ];
}

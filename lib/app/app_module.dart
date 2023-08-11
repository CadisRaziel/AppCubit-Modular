import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/home/home_module.dart';
import 'package:jobtimer/app/modules/login/login_module.dart';
import 'package:jobtimer/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute('/', child: (_, __) => Container());
    ChildRoute('/', child: (context, args) => const SplashPage()), //*-> Para adicionar uma nova página
    ModuleRoute('/login', module: LoginModule()), //*-> Para adicionar um novo módulo (como nosso modulo de login)
    ModuleRoute('/home', module: HomeModule()), //*-> Para adicionar um novo módulo (como nosso modulo de login)
  ];
}

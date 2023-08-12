import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/login/controller/login_controller.dart';
import 'package:jobtimer/app/modules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
    //Parametros da pagina é incluido aqui
    //Antes lembre-se o loginController precisa ser acessado por mais alguem ? se não podemos deixar ela dentro do bind do proprio login_module e nao no app_module
    BlocBind.lazySingleton((i) => LoginController(authService: i())) //* i() -> Vai se virar para procurar la dentro do app_module aonde esta o bind do authService
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context,args) => LoginPage(controller: Modular.get())) //* Modular.get() => assim como o getX o modular.get vai ir procurar o parametro dessa pagina no bind
  ];
}

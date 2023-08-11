import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute('/', child: (_, __) => Container());
    ChildRoute('/', child: (context, args) => const SplashPage()),
  ];
}

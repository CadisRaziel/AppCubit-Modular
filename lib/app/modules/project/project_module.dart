import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/project/detail/project_detail_module.dart';
import 'package:jobtimer/app/modules/project/register/project_register_module.dart';

class ProjectModule extends Module{
   @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/register', module: ProjectRegisterModule()),
    ModuleRoute('/detail', module: ProjectDetailModule())
  ];
}
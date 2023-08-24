import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/project/detail/project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const ProjectDetailPage(),
    )
  ];
}

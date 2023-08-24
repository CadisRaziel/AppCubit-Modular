import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/modules/core/ui/job_timer_icons.dart';
import 'package:jobtimer/app/modules/view_models/project_view_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectViewModel projectModel;
  const ProjectTile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: (){Modular.to.pushNamed('/project/detail', arguments: projectModel);}, //-> Passando o projectModel para a tela de detalhe do projeto
          child: Container(
        constraints: const BoxConstraints(maxHeight: 90), //-> Pode esticar até 90
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            _projectName(projectModel: projectModel),
            Expanded(child: _ProjectProgress(projectModel: projectModel)),
          ],
        ),
      ),
    );
  }
}

class _projectName extends StatelessWidget {
  final ProjectViewModel projectModel;
  const _projectName({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(projectModel.name ?? ""),
      Icon(
        JobTimerIcons.angle_double_right,
        size: 20,
        color: Theme.of(context).primaryColor,
      ),
    ],
        ),
      );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectViewModel projectModel;
  const _ProjectProgress({required this.projectModel});

  @override
  Widget build(BuildContext context) {

    ///Calculo do LinearProgressIndicator
    final totalTasks = projectModel.tasks.fold<int>(0, (previousValue, task) => previousValue += task.duration); //vai ver todas as tasks e somar todas elas para ver o total de hora gastas
    // final totalTasks = 10; //para testar
    var percent = 0.0;
    if(totalTasks > 0){
      percent = totalTasks / (projectModel.estimate ?? 0);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
         Expanded(child: LinearProgressIndicator(
          value: percent,
          backgroundColor: Colors.grey[400],
          color: Theme.of(context).primaryColor,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text("${projectModel.estimate}h"),
        ),
      ]),
    );
  }
}

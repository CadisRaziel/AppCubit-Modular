import 'package:flutter/material.dart';
import 'package:jobtimer/app/modules/core/ui/job_timer_icons.dart';
import 'package:jobtimer/app/modules/project/detail/widgets/project_detail_app_bar.dart';
import 'package:jobtimer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:jobtimer/app/modules/project/detail/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  child: ProjectPieChart(),
                ),
                ProjectTaskTile(),
                ProjectTaskTile(),
                ProjectTaskTile(),
              ],
            ),
          ), //-> rolagem,
          SliverFillRemaining(
            ///utiliza o resto da tela
            hasScrollBody: false, //-> nao tem scroll
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(JobTimerIcons.ok_circled2),
                  label: const Text(
                    "Finalizar Projeto",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

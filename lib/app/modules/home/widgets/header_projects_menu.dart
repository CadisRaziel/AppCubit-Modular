// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/home/controller/home_controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  final HomeController controller;
  HeaderProjectsMenu({
    required this.controller,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: constraints.maxHeight,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: constraints.maxWidth * 0.5,
            child: DropdownButtonFormField<ProjectStatus>(
                value: ProjectStatus
                    .em_andamento, //quando entrar na tela vai setar o em_andamento na label
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  isCollapsed: true,
                ),
                items: ProjectStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.filterDropDown(value);
                  }
                }),
          ),
          SizedBox(
              width: constraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await Modular.to.pushNamed('/project/register');
                    controller.loadProjects();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Novo projeto"))),
        ]),
      );
    });
  }

  @override
  double get maxExtent => 80; //-> tamanho que ele vai fica ao fazer scroll

  @override
  double get minExtent => 80; //-> tamanho que ele vai fica ao fazer scroll

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; //-> pode ser rebuildado
  }
}

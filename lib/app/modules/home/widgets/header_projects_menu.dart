import 'package:flutter/material.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
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
                onChanged: (value) {}),
          ),
          SizedBox(
              width: constraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                  onPressed: () {},
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
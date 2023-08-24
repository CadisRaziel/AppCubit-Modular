import 'package:flutter/material.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({super.key})
      : super(
          expandedHeight: 100,
          pinned: true, //->quando move a tela pra cima a app bar fica parada
          toolbarHeight: 100,
          title: const Text("Projeto Y"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.vertical(
            bottom: Radius.circular(15),
          )),
          flexibleSpace: Stack(children: [
            ///Barrinha branca logo abaixo da azul
            Align(
              alignment: const Alignment(0, 1.6),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("10 Tasks"),
                          _NewTasks(),
                        ]),
                  ),
                ),
              ),
            )
          ]),
        );
}

class _NewTasks extends StatelessWidget {
  const _NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const Text("Adicionar Task")
      ],
    );
  }
}

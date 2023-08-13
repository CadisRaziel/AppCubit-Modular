import 'package:flutter/material.dart';
import 'package:jobtimer/app/modules/home/widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
          child: SafeArea(
              child: ListTile(
        title: Text("Sair"),
      ))),
      body: SafeArea(
              child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("Projetos"),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.red, height: 100, width: 100),
            ]))
          ],
        ),
      ),
    );
  }
}

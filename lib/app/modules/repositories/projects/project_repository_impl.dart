// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:jobtimer/app/modules/core/database/database.dart';
import 'package:jobtimer/app/modules/core/exceptions/failure.dart';
import 'package:jobtimer/app/modules/entities/project.dart';
import 'package:jobtimer/app/modules/entities/project_status.dart';
import 'package:jobtimer/app/modules/repositories/projects/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  //!Encapsulamento
  final Database _dataBase;
  ProjectRepositoryImpl({
    required Database database,
  }) : _dataBase = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _dataBase.openConnection();

      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log("Erro ao cadastrar o projeto", error: e, stackTrace: s);
      throw Failure(message: "Erro ao cadastrar o projeto");
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _dataBase.openConnection();
    final projects = await connection.projects
        .filter()
        .statusEqualTo(status)
        .findAll(); //Buscar pelo status

    return projects;
  }
}

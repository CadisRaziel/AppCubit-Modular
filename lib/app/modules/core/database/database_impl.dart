import 'package:isar/isar.dart';
import 'package:jobtimer/app/modules/core/database/database.dart';
import 'package:jobtimer/app/modules/entities/project.dart';
import 'package:jobtimer/app/modules/entities/project_task.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseImpl implements Database {


  Isar? _databaseInstance; //*-> vamos criar um singleton para nao correr o risco de ficar varias instancias abertas com esse banco de dados

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstance == null) {
      //*Encontrar o diretorio do banco de dados utilizando o path_provider
      final dir = await getApplicationSupportDirectory();

      _databaseInstance = await Isar.open(
        schemas: [
          //*Classes criadas pelo build_runner
          ProjectTaskSchema,
          ProjectSchema,
        ],
        directory: dir.path,
        inspector: true, //-> como se fosse um client visual do banco de dados como o mysql workbench
      );
    }
    return _databaseInstance!;
  }

}
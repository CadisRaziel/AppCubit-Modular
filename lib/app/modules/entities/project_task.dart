//? Aqui criamos uma entidade assim como criamos no java

import 'package:isar/isar.dart';

part 'project_task.g.dart'; //? -> o build_runner junto do isar vai gerar essa classe gigantesca

//*Assim como o java o Isar tambem tem annotations
@Collection()
class ProjectTask {

  @Id()
  int? id;

  late String name;
  
  late int duration;

  late DateTime created = DateTime.now();
}

//!Após criar a task precisamos rodar um comando no terminal(O gerador de código build_runner): flutter pub run build_runner watch --delete-conflicting-outputs
//!--delete-conflicting-outputs -> para evitar conflito com cache
//!Succeeded after 10.7s with 1 outputs (43 actions) -> deu sucesso ao gerar
//!as vezes ele pode pedir pra mind colocar isso (part 'project_task.g.dart';)

//*No final de tudo que criou todas tabelas, testou a conexão, criou algo pra teste ai sim podemos parar o build_runner no terminal
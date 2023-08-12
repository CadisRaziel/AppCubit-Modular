enum ProjectStatus {
  ///Aqui iremos utilizar o novo enum do dart
  em_andamento(label: "Em andamento"),
  finalizado(label: "Finalizado");

  final String label;
  const ProjectStatus({required this.label});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProjectTaskModel {
  //!Task model referente ao Project task
  int? id;
  String name;
  int duration;
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });
}

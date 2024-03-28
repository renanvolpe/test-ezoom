// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'todos.g.dart';

@JsonSerializable()
class Todos {
  int userId;
  int id;
  String title;
  String completed;

  Todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  Map<String, dynamic> toJson() => _$TodosToJson(this);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@JsonSerializable()
class Comments {
  @JsonKey(name: "_uuid")
  String uuid;
  String idNews;
  String name;
  String email;
  String body;
 
  Comments({
    required this.uuid,
    required this.idNews,
    required this.name,
    required this.email,
    required this.body,
  });
 factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}


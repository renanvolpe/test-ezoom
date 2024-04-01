// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@JsonSerializable()
class Comments {
  @JsonKey(name: "_uuid")
  String uuid;
  String comment;
  @JsonKey(name: 'datetime_post')
  String dateTime;
  String name;
  String idNews;
  Comments({
    required this.uuid,
    required this.comment,
    required this.dateTime,
    required this.name,
    required this.idNews,
  });

  factory Comments.empty(String idNews) => Comments(comment: "", dateTime: "", name: "", idNews: idNews, uuid: '');
  factory Comments.example(String idNews) => Comments(comment: "Comments here", dateTime: "", name: "Name", idNews: idNews, uuid: '');

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}

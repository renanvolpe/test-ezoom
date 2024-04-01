// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_comment.g.dart';

@JsonSerializable()
class ItemComment {
  @JsonKey(name: "_uuid")
  String uuid;
  String idNews;
  @JsonKey(name: "comment")
  List<Comments> listComment;

  ItemComment({
    required this.uuid,
    required this.idNews,
    required this.listComment,
  });
  factory ItemComment.fromJson(Map<String, dynamic> json) => _$ItemCommentFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCommentToJson(this);
}

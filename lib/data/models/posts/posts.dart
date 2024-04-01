// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'posts.g.dart';

@JsonSerializable()
class Posts {
  dynamic userId;
  int id;
  String title;
  String body;
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.empty() => Posts(userId: "1", id: 1, title: "title", body: "body");

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

  Map<String, dynamic> toJson() => _$PostsToJson(this);
}

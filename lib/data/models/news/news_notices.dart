// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'news_notices.g.dart';

@JsonSerializable()
class NewsNotices {
  @JsonKey(name: "_uuid")
  String uuid;
  @JsonKey(name: "datetime_post")
  String datetimePost;
  String description;
  String photo;
  String title;
  bool wasRead;

  NewsNotices({
    required this.uuid,
    required this.datetimePost,
    required this.description,
    required this.photo,
    required this.title,
    required this.wasRead,
  });

  factory NewsNotices.empty() =>
      NewsNotices(uuid: "", datetimePost: "2024-03-19T13:15:00Z", description: "New description", photo: "", title: "title", wasRead: false);

  factory NewsNotices.fromJson(Map<String, dynamic> json) => _$NewsNoticesFromJson(json);

  Map<String, dynamic> toJson() => _$NewsNoticesToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemComment _$ItemCommentFromJson(Map<String, dynamic> json) => ItemComment(
      uuid: json['_uuid'] as String,
      idNews: json['idNews'] as String,
      listComment: (json['comment'] as List<dynamic>)
          .map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemCommentToJson(ItemComment instance) =>
    <String, dynamic>{
      '_uuid': instance.uuid,
      'idNews': instance.idNews,
      'comment': instance.listComment,
    };

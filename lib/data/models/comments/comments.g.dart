// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      uuid: json['_uuid'] as String,
      comment: json['comment'] as String,
      dateTime: json['datetime_post'] as String,
      name: json['name'] as String,
      idNews: json['idNews'] as String,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      '_uuid': instance.uuid,
      'comment': instance.comment,
      'datetime_post': instance.dateTime,
      'name': instance.name,
      'idNews': instance.idNews,
    };

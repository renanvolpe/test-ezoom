// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_notices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsNotices _$NewsNoticesFromJson(Map<String, dynamic> json) => NewsNotices(
      uuid: json['_uuid'] as String,
      datetimePost: json['datetime_post'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
      title: json['title'] as String,
      wasRead: json['wasRead'] as bool,
    );

Map<String, dynamic> _$NewsNoticesToJson(NewsNotices instance) =>
    <String, dynamic>{
      '_uuid': instance.uuid,
      'datetime_post': instance.datetimePost,
      'description': instance.description,
      'photo': instance.photo,
      'title': instance.title,
      'wasRead': instance.wasRead,
    };

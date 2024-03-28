// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      uuid: json['_uuid'] as String,
      idNews: json['idNews'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      '_uuid': instance.uuid,
      'idNews': instance.idNews,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };

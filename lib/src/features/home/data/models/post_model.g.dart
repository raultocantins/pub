// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map json) => PostModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      pubName: json['pubName'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'pubName': instance.pubName,
      'date': instance.date.toIso8601String(),
    };

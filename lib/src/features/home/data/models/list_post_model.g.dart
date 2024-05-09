// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPostModel _$ListPostModelFromJson(Map json) => ListPostModel(
      list: (json['list'] as List<dynamic>?)?.map(PostModel.fromJson).toList(),
      page: (json['page'] as num?)?.toInt(),
      hasMore: json['hasMore'] as bool?,
    );

Map<String, dynamic> _$ListPostModelToJson(ListPostModel instance) =>
    <String, dynamic>{
      'list': instance.list?.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'hasMore': instance.hasMore,
    };

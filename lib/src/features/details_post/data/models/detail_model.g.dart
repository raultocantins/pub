// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map json) => DetailModel(
      description: json['description'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'lat': instance.lat,
      'lng': instance.lng,
    };

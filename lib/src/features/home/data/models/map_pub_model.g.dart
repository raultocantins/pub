// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_pub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapPubModel _$MapPubModelFromJson(Map json) => MapPubModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String,
      pubName: json['pubName'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MapPubModelToJson(MapPubModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lat': instance.lat,
      'lng': instance.lng,
      'pubName': instance.pubName,
      'address': instance.address,
      'images': instance.images,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_pub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPubModel _$DetailPubModelFromJson(Map json) => DetailPubModel(
      contactNumber: json['contactNumber'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DetailPubModelToJson(DetailPubModel instance) =>
    <String, dynamic>{
      'contactNumber': instance.contactNumber,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'images': instance.images,
    };

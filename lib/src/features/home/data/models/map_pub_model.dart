import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';

part 'map_pub_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class MapPubModel {
  String id;
  String imageUrl;
  double lat;
  double lng;
  String pubName;
  String address;
  List<String> images;

  MapPubModel(
      {required this.id,
      required this.imageUrl,
      required this.lat,
      required this.lng,
      required this.address,
      required this.pubName,
      required this.images});

  factory MapPubModel.fromJson(dynamic json) => _$MapPubModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapPubModelToJson(this);

  static MapPubEntity toEntity(MapPubModel model) {
    return MapPubEntity(
      id: model.id,
      imageUrl: model.imageUrl,
      location: LatLng(model.lat, model.lng),
      address: model.address,
      pubName: model.pubName,
      images: model.images,
    );
  }

  static MapPubModel toModel(MapPubEntity entity) {
    return MapPubModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      lat: entity.location.latitude,
      lng: entity.location.longitude,
      address: entity.address,
      pubName: entity.pubName,
      images: entity.images,
    );
  }
}

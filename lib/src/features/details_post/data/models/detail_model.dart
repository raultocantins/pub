import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:pub/src/features/details_post/domain/entities/detail_entity.dart';

part 'detail_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class DetailModel {
  String description;
  double lat;
  double lng;

  DetailModel(
      {required this.description, required this.lat, required this.lng});

  factory DetailModel.fromJson(dynamic json) => _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);

  static DetailEntity toEntity(DetailModel model) {
    return DetailEntity(
      description: model.description,
      location: LatLng(model.lat, model.lng),
    );
  }

  static DetailModel toModel(DetailEntity entity) {
    return DetailModel(
      description: entity.description,
      lat: entity.location.latitude,
      lng: entity.location.longitude,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:pub/src/features/details_pub/domain/entities/detail_pub.dart';

part 'detail_pub_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class DetailPubModel {
  String contactNumber;
  double lat;
  double lng;
  String address;
  List<String> images;

  DetailPubModel({
    required this.contactNumber,
    required this.address,
    required this.lat,
    required this.lng,
    required this.images,
  });

  factory DetailPubModel.fromJson(dynamic json) =>
      _$DetailPubModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailPubModelToJson(this);

  static DetailPubEntity toEntity(DetailPubModel model) {
    return DetailPubEntity(
        address: model.address,
        contactNumber: model.contactNumber,
        images: model.images,
        location: LatLng(model.lat, model.lng));
  }

  static DetailPubModel toModel(DetailPubEntity entity) {
    return DetailPubModel(
      address: entity.address,
      contactNumber: entity.contactNumber,
      images: entity.images,
      lat: entity.location.latitude,
      lng: entity.location.longitude,
    );
  }
}

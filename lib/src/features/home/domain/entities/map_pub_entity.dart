import 'package:latlong2/latlong.dart';

class MapPubEntity {
  String id;
  String imageUrl;
  LatLng location;
  String pubName;
  String address;
  List<String> images;

  MapPubEntity({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.address,
    required this.pubName,
    required this.images,
  });
}

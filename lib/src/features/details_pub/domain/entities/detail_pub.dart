import 'package:latlong2/latlong.dart';

class DetailPubEntity {
  String contactNumber;
  LatLng location;
  String address;
  List<String> images;
  DetailPubEntity({
    required this.contactNumber,
    required this.location,
    required this.address,
    required this.images,
  });
}

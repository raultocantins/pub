import 'package:pub/src/features/home/data/models/map_pub_model.dart';

abstract class GetMapPubsDatasource {
  Future<List<MapPubModel>> call();
}

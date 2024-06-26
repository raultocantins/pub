import 'package:pub/src/features/home/data/datasourcers/get_map_pubs_datasource.dart';
import 'package:pub/src/features/home/data/models/map_pub_model.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';
import 'package:pub/src/shared/utils/mock_http.dart';

class GetMapPubsDatasourceImpl implements GetMapPubsDatasource {
  @override
  Future<List<MapPubModel>> call({
    String? searchText,
    EnvironmentType? environmentType,
    TimeType? timeType,
    PriceType? priceType,
  }) async {
    try {
      final response = await MockHttpResponse.getMapPubs();
      if (response['pubs'] != null) {
        return (response['pubs'] as List)
            .map((e) => MapPubModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception();
    }
  }
}

import 'package:pub/src/features/home/data/models/map_pub_model.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';

abstract class GetMapPubsDatasource {
  Future<List<MapPubModel>> call({
    String? searchText,
    EnvironmentType? environmentType,
    TimeType? timeType,
    PriceType? priceType,
  });
}

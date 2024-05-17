import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';

abstract class GetMapPubsRepository {
  Future<Either<Exception, List<MapPubEntity>>> call({
    String? searchText,
    EnvironmentType? environmentType,
    TimeType? timeType,
    PriceType? priceType,
  });
}

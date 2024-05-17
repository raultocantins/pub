import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_map_pubs_repository.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';

abstract class GetMapPubsUsecase {
  Future<Either<Exception, List<MapPubEntity>>> call({
    String? searchText,
    EnvironmentType? environmentType,
    TimeType? timeType,
    PriceType? priceType,
  });
}

class GetMapPubsUsecaseImpl implements GetMapPubsUsecase {
  final GetMapPubsRepository _repository;
  GetMapPubsUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, List<MapPubEntity>>> call({
    String? searchText,
    EnvironmentType? environmentType,
    TimeType? timeType,
    PriceType? priceType,
  }) {
    return _repository(
      searchText: searchText,
      environmentType: environmentType,
      timeType: timeType,
      priceType: priceType,
    );
  }
}

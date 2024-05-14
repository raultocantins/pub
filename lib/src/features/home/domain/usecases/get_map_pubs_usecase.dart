import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_map_pubs_repository.dart';

abstract class GetMapPubsUsecase {
  Future<Either<Exception, List<MapPubEntity>>> call();
}

class GetMapPubsUsecaseImpl implements GetMapPubsUsecase {
  final GetMapPubsRepository _repository;
  GetMapPubsUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, List<MapPubEntity>>> call() {
    return _repository();
  }
}

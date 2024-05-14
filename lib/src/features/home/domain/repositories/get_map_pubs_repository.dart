import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';

abstract class GetMapPubsRepository {
  Future<Either<Exception, List<MapPubEntity>>> call();
}

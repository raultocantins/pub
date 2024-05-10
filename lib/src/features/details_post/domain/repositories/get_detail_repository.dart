import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_post/domain/entities/detail_entity.dart';

abstract class GetDetailRepository {
  Future<Either<Exception, DetailEntity>> call();
}

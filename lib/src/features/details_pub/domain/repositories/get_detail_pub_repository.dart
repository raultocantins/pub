import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_pub/domain/entities/detail_pub.dart';

abstract class GetDetailPubRepository {
  Future<Either<Exception, DetailPubEntity>> call();
}

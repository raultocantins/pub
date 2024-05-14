import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/data/datasourcers/get_map_pubs_datasource.dart';
import 'package:pub/src/features/home/data/models/map_pub_model.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_map_pubs_repository.dart';

class GetMapPubsRepositoryImpl implements GetMapPubsRepository {
  final GetMapPubsDatasource _datasource;
  GetMapPubsRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, List<MapPubEntity>>> call() async {
    try {
      final result = await _datasource();
      return Right(result.map((e) => MapPubModel.toEntity(e)).toList());
    } catch (_) {
      return Left(Exception());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_pub/data/datasourcers/get_detail_pub_datasource.dart';
import 'package:pub/src/features/details_pub/data/models/detail_pub_model.dart';
import 'package:pub/src/features/details_pub/domain/entities/detail_pub.dart';
import 'package:pub/src/features/details_pub/domain/repositories/get_detail_pub_repository.dart';

class GetDetailPubRepositoryImpl implements GetDetailPubRepository {
  final GetDetailPubDatasource _datasource;
  GetDetailPubRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, DetailPubEntity>> call() async {
    try {
      final result = await _datasource();
      return Right(DetailPubModel.toEntity(result));
    } catch (_) {
      return Left(Exception());
    }
  }
}

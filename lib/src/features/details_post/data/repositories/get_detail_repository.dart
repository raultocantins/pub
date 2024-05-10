import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_post/data/datasourcers/get_detail_datasource.dart';
import 'package:pub/src/features/details_post/data/models/detail_model.dart';
import 'package:pub/src/features/details_post/domain/entities/detail_entity.dart';
import 'package:pub/src/features/details_post/domain/repositories/get_detail_repository.dart';

class GetDetailRepositoryImpl implements GetDetailRepository {
  final GetDetailDatasource _datasource;
  GetDetailRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, DetailEntity>> call() async {
    try {
      final result = await _datasource();
      return Right(DetailModel.toEntity(result));
    } catch (_) {
      return Left(Exception());
    }
  }
}

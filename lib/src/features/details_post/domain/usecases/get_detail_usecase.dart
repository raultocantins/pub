import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_post/domain/entities/detail_entity.dart';
import 'package:pub/src/features/details_post/domain/repositories/get_detail_repository.dart';

abstract class GetDetailUsecase {
  Future<Either<Exception, DetailEntity>> call();
}

class GetDetailUsecaseImpl implements GetDetailUsecase {
  final GetDetailRepository _repository;
  GetDetailUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, DetailEntity>> call() {
    return _repository();
  }
}

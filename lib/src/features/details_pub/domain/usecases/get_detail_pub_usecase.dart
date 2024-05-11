import 'package:dartz/dartz.dart';
import 'package:pub/src/features/details_pub/domain/entities/detail_pub.dart';
import 'package:pub/src/features/details_pub/domain/repositories/get_detail_pub_repository.dart';

abstract class GetDetailPubUsecase {
  Future<Either<Exception, DetailPubEntity>> call();
}

class GetDetailPubUsecaseImpl implements GetDetailPubUsecase {
  final GetDetailPubRepository _repository;
  GetDetailPubUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, DetailPubEntity>> call() {
    return _repository();
  }
}

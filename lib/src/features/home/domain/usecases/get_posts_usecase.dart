import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_post_repository.dart';

abstract class GetPostsUsecase {
  Future<Either<Exception, ListPostEntity>> call();
}

class GetPostsUsecaseImpl implements GetPostsUsecase {
  final GetPostsRepository _repository;
  GetPostsUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, ListPostEntity>> call() {
    return _repository();
  }
}

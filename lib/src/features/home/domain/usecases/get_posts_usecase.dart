import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_post_repository.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';

abstract class GetPostsUsecase {
  Future<Either<Exception, ListPostEntity>> call(
      {required int page, required PostType type});
}

class GetPostsUsecaseImpl implements GetPostsUsecase {
  final GetPostsRepository _repository;
  GetPostsUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, ListPostEntity>> call(
      {required int page, required PostType type}) {
    return _repository(page: page, type: type);
  }
}

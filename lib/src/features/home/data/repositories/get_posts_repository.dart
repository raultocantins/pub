import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/data/datasourcers/get_posts_datasource.dart';
import 'package:pub/src/features/home/data/models/list_post_model.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/domain/repositories/get_post_repository.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';

class GetPostsRepositoryImpl implements GetPostsRepository {
  final GetPostsDatasource _datasource;
  GetPostsRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, ListPostEntity>> call(
      {required int page, required PostType type}) async {
    try {
      final result = await _datasource(page: page, type: type);
      return Right(ListPostModel.toEntity(result));
    } catch (_) {
      return Left(Exception());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';

abstract class GetPostsRepository {
  Future<Either<Exception, ListPostEntity>> call();
}

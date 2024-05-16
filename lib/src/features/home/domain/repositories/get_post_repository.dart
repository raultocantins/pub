import 'package:dartz/dartz.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';

abstract class GetPostsRepository {
  Future<Either<Exception, ListPostEntity>> call(
      {required int page, required PostType type});
}

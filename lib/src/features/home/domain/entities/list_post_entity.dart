import 'package:pub/src/features/home/domain/entities/post_entity.dart';

class ListPostEntity {
  List<PostEntity>? list;
  int? page;
  bool? hasMore;

  ListPostEntity({
    required this.list,
    this.page,
    this.hasMore,
  });
}

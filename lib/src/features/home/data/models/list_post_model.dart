import 'package:json_annotation/json_annotation.dart';
import 'package:pub/src/features/home/data/models/post_model.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';

part 'list_post_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ListPostModel {
  List<PostModel>? list;
  int? page;
  bool? hasMore;

  ListPostModel({
    this.list,
    this.page,
    this.hasMore,
  });

  factory ListPostModel.fromJson(dynamic json) => _$ListPostModelFromJson(json);

  static ListPostEntity toEntity(ListPostModel model) {
    return ListPostEntity(
        list: model.list?.map((e) => PostModel.toEntity(e)).toList(),
        page: model.page,
        hasMore: model.hasMore);
  }

  static ListPostModel toModel(ListPostEntity entity) {
    return ListPostModel(
        list: entity.list?.map((e) => PostModel.toModel(e)).toList(),
        page: entity.page,
        hasMore: entity.hasMore);
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:pub/src/features/home/domain/entities/post_entity.dart';

part 'post_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class PostModel {
  String id;
  String imageUrl;
  String title;
  String? description;
  String pubName;
  DateTime date;

  PostModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.pubName,
    this.description,
  });

  factory PostModel.fromJson(dynamic json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  static PostEntity toEntity(PostModel model) {
    return PostEntity(
        id: model.id,
        date: model.date,
        imageUrl: model.imageUrl,
        pubName: model.pubName,
        title: model.title,
        description: model.description);
  }

  static PostModel toModel(PostEntity entity) {
    return PostModel(
      id: entity.id,
      date: entity.date,
      imageUrl: entity.imageUrl,
      pubName: entity.pubName,
      title: entity.title,
      description: entity.description,
    );
  }
}

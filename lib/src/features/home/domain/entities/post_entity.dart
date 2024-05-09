class PostEntity {
  String id;
  String imageUrl;
  String title;
  String? description;
  String pubName;
  DateTime date;
  String pubId;
  String pubImageUrl;

  PostEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.pubName,
    required this.pubId,
    required this.pubImageUrl,
    this.description,
  });
}

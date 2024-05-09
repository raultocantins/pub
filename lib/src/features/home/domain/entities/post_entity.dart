class PostEntity {
  String id;
  String imageUrl;
  String title;
  String? description;
  String pubName;
  DateTime date;

  PostEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.pubName,
    this.description,
  });
}

import '../../domain/entities/story_image_entity.dart';

class StoryImageModel extends StoryImageEntity {
  final String id;
  final String imageUrl;
  final DateTime createdAt;

  StoryImageModel({
    required this.id,
    required this.imageUrl,
    required this.createdAt,
  }) : super(storyImageId: id, url: imageUrl, time: DateTime.now().difference(createdAt));

  factory StoryImageModel.fromJson(Map<String, dynamic> json) {
    return StoryImageModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

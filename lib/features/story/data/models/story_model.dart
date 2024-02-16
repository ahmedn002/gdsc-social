import 'package:gdsc_social/features/story/data/models/story_image_model.dart';

import '../../domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  final String id;
  final String tag;
  final String userName;
  final String userImage;
  final List<StoryImageModel> images;

  StoryModel({
    required this.id,
    required this.tag,
    required this.userName,
    required this.userImage,
    required this.images,
  }) : super(storyId: id, userTag: tag, userImageUrl: userImage, storyImages: images);

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      tag: json['tag'],
      userName: json['userName'],
      userImage: json['userImage'],
      images: (json['images'] as List).map((e) => StoryImageModel.fromJson(e)).toList(),
    );
  }
}

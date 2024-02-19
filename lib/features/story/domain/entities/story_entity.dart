import 'package:gdsc_social/features/story/domain/entities/story_image_entity.dart';

class StoryEntity {
  final String storyId;
  final String userName;
  final String userImageUrl;
  final String userTag;
  final List<StoryImageEntity> storyImages;

  StoryEntity({
    required this.storyId,
    required this.userName,
    required this.userImageUrl,
    required this.userTag,
    required this.storyImages,
  });
}

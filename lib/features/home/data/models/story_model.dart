import '../../domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  final String id;
  final String tag;
  final String userName;
  final String userImage;

  StoryModel({
    required this.id,
    required this.tag,
    required this.userName,
    required this.userImage,
  }) : super(storyId: id, userTag: tag, userImageUrl: userImage);

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      tag: json['tag'],
      userName: json['userName'],
      userImage: json['userImage'],
    );
  }
}

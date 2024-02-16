import 'package:gdsc_social/features/story/data/models/story_image_model.dart';

import '../../../../core/utils/stub.dart';
import '../models/story_model.dart';

final List<StoryModel> storyStubs = [
  StoryModel(
    id: '1',
    tag: 'JohnDoe',
    userName: 'John Doe',
    userImage: StubUtils.getRandomAvatar(false),
    images: [
      StoryImageModel(
        id: '1',
        imageUrl: 'https://picsum.photos/200/300',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      StoryImageModel(
        id: '2',
        imageUrl: 'https://picsum.photos/200/300',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      StoryImageModel(
        id: '3',
        imageUrl: 'https://picsum.photos/200/300',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ],
  ),
];

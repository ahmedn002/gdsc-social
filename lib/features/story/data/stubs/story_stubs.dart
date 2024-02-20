import 'package:flutter_animate/flutter_animate.dart';
import 'package:gdsc_social/features/story/data/models/story_image_model.dart';

import '../../../../core/utils/stub.dart';
import '../models/story_model.dart';

final List<StoryModel> storyStubs = [
  StoryModel(
    id: '1',
    tag: 'JohnDoe',
    userName: 'John Doe',
    userImage: StubUtils.getRandomAvatar(id: 1),
    images: [
      StoryImageModel(
        id: '1',
        imageUrl: 'https://picsum.photos/1000/1500?random=1',
        createdAt: DateTime.now().subtract(23.hours),
      ),
      StoryImageModel(
        id: '2',
        imageUrl: 'https://picsum.photos/1000/1500?random=2',
        createdAt: DateTime.now().subtract(22.hours),
      ),
      StoryImageModel(
        id: '3',
        imageUrl: 'https://picsum.photos/1000/1500?random=3',
        createdAt: DateTime.now().subtract(21.hours),
      ),
    ],
  ),
  StoryModel(
    id: '2',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(girl: true),
    images: [
      StoryImageModel(
        id: '4',
        imageUrl: 'https://picsum.photos/1000/1500?random=4',
        createdAt: DateTime.now().subtract(8.hours),
      ),
      StoryImageModel(
        id: '5',
        imageUrl: 'https://picsum.photos/1000/1500?random=5',
        createdAt: DateTime.now().subtract(7.hours),
      ),
      StoryImageModel(
        id: '6',
        imageUrl: 'https://picsum.photos/1000/1500?random=6',
        createdAt: DateTime.now().subtract(6.hours),
      ),
      StoryImageModel(
        id: '7',
        imageUrl: 'https://picsum.photos/1000/1500?random=7',
        createdAt: DateTime.now().subtract(5.hours),
      ),
    ],
  ),
  StoryModel(
    id: '3',
    tag: 'JohnathanDoe',
    userName: 'Johnathan Doe',
    userImage: StubUtils.getRandomAvatar(id: 3),
    images: [
      StoryImageModel(
        id: '8',
        imageUrl: 'https://picsum.photos/1000/1500?random=8',
        createdAt: DateTime.now().subtract(3.hours),
      ),
      StoryImageModel(
        id: '9',
        imageUrl: 'https://picsum.photos/1000/1500?random=9',
        createdAt: DateTime.now().subtract(2.hours),
      ),
    ],
  ),
  StoryModel(
    id: '4',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(girl: true),
    images: [
      StoryImageModel(
        id: '10',
        imageUrl: 'https://picsum.photos/1000/1500?random=10',
        createdAt: DateTime.now().subtract(1.hours),
      ),
      StoryImageModel(
        id: '11',
        imageUrl: 'https://picsum.photos/1000/1500?random=11',
        createdAt: DateTime.now().subtract(32.minutes),
      ),
    ],
  )
];

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
        imageUrl: 'https://picsum.photos/1000/1500',
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
  StoryModel(
    id: '2',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(id: 2),
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
  StoryModel(
    id: '3',
    tag: 'JohnDoe',
    userName: 'John Doe',
    userImage: StubUtils.getRandomAvatar(id: 3),
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
  StoryModel(
    id: '4',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(id: 4),
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
  StoryModel(
    id: '5',
    tag: 'JohnDoe',
    userName: 'John Doe',
    userImage: StubUtils.getRandomAvatar(id: 5),
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
  StoryModel(
    id: '6',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(id: 6),
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

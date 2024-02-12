import 'package:gdsc_social/core/utils/stub.dart';

import '../../domain/entities/story_entity.dart';

final List<StoryEntity> storyStubs = [
  StoryEntity(
    storyId: '1',
    userImageUrl: StubUtils.getRandomAvatar(true),
    userTag: 'JaneDoe',
  ),
  StoryEntity(
    storyId: '2',
    userImageUrl: StubUtils.getRandomAvatar(),
    userTag: 'JohnDoe12',
  ),
  StoryEntity(
    storyId: '3',
    userImageUrl: StubUtils.getRandomAvatar(true),
    userTag: 'JannaDoe30',
  ),
  StoryEntity(
    storyId: '4',
    userImageUrl: StubUtils.getRandomAvatar(true),
    userTag: 'JanetDoe21',
  ),
  StoryEntity(
    storyId: '5',
    userImageUrl: StubUtils.getRandomAvatar(),
    userTag: 'JonathonDoe',
  ),
  StoryEntity(
    storyId: '6',
    userImageUrl: StubUtils.getRandomAvatar(true),
    userTag: 'JennyDoe',
  ),
];

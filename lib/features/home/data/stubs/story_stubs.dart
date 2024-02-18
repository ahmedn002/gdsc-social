import 'package:gdsc_social/core/utils/stub.dart';
import 'package:gdsc_social/features/home/data/models/story_model.dart';

final List<StoryModel> storyStubs = [
  StoryModel(
    id: '1',
    tag: 'JohnDoe',
    userName: 'John Doe',
    userImage: StubUtils.getRandomAvatar(id: 1),
  ),
  StoryModel(
    id: '2',
    tag: 'JaneDoe',
    userName: 'Jane Doe',
    userImage: StubUtils.getRandomAvatar(girl: true),
  ),
  StoryModel(
    id: '3',
    tag: 'JohnathanDoe',
    userName: 'Johnathan Doe',
    userImage: StubUtils.getRandomAvatar(),
  ),
  StoryModel(
    id: '4',
    tag: 'JaneyDoe',
    userName: 'Janey Doe',
    userImage: StubUtils.getRandomAvatar(girl: true),
  ),
  StoryModel(
    id: '5',
    tag: 'JohnnyDoe',
    userName: 'Johnny Doe',
    userImage: StubUtils.getRandomAvatar(),
  ),
  StoryModel(
    id: '6',
    tag: 'JanetDoe',
    userName: 'Janet Doe',
    userImage: StubUtils.getRandomAvatar(girl: true),
  ),
];

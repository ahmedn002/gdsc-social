import '../../domain/entities/story_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<StoryEntity>> getStories();
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  @override
  Future<List<StoryEntity>> getStories() {
    final List<StoryEntity> storyStubs = [
      StoryEntity(
        storyId: '1',
        userImageUrl: 'https://avatar.iran.liara.run/public/girl?username=1',
        userTag: '@JaneDoe',
      ),
      StoryEntity(
        storyId: '2',
        userImageUrl: 'https://avatar.iran.liara.run/public/2',
        userTag: '@JohnDoe12',
      ),
      StoryEntity(
        storyId: '3',
        userImageUrl: 'https://avatar.iran.liara.run/public/girl?username=2',
        userTag: '@JannaDoe30',
      ),
      StoryEntity(
        storyId: '4',
        userImageUrl: 'https://avatar.iran.liara.run/public/girl?username=',
        userTag: '@JanetDoe21',
      ),
      StoryEntity(
        storyId: '5',
        userImageUrl: 'https://avatar.iran.liara.run/public/5',
        userTag: '@JonathonDoeeeeeee',
      ),
      StoryEntity(
        storyId: '6',
        userImageUrl: 'https://avatar.iran.liara.run/public/girl?username=8',
        userTag: '@JennyDoe',
      ),
    ];
    return Future.value(storyStubs);
  }
}

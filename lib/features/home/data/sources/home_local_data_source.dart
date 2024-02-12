import '../../domain/entities/story_entity.dart';

abstract class HomeLocalDataSource {
  List<StoryEntity> getStories();
}

class HomeLocalDataSourceImplementation implements HomeLocalDataSource {
  @override
  List<StoryEntity> getStories() {
    final List<StoryEntity> storyStubs = [
      StoryEntity(
        storyId: '1',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JaneDoe',
      ),
      StoryEntity(
        storyId: '2',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JohnDoe12',
      ),
      StoryEntity(
        storyId: '3',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JannaDoe30',
      ),
      StoryEntity(
        storyId: '4',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JanetDoe21',
      ),
      StoryEntity(
        storyId: '5',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JennyDoe',
      ),
      StoryEntity(
        storyId: '6',
        userImageUrl: 'https://i.pravatar.cc/300',
        userTag: '@JennyDoe',
      ),
    ];
    return storyStubs;
  }
}

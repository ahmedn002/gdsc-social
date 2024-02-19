import '../../../story/data/stubs/story_stubs.dart';
import '../../../story/domain/entities/story_entity.dart';

abstract class HomeLocalDataSource {
  List<StoryEntity> getStories();
}

class HomeLocalDataSourceImplementation implements HomeLocalDataSource {
  @override
  List<StoryEntity> getStories() {
    return storyStubs;
  }
}

import 'package:collection/collection.dart';

import '../models/story_model.dart';
import '../stubs/story_stubs.dart';

abstract class StoryLocalDataSource {
  StoryModel? getStory(String id);
}

class StoryLocalDataSourceImplementation implements StoryLocalDataSource {
  @override
  StoryModel? getStory(String id) {
    return storyStubs.firstWhereOrNull((element) => element.id == id);
  }
}

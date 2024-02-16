import 'package:collection/collection.dart';

import '../models/story_model.dart';
import '../stubs/story_stubs.dart';

abstract class StoryRemoteDataSource {
  Future<StoryModel?> getStory(String id);
}

class StoryRemoteDataSourceImplementation implements StoryRemoteDataSource {
  @override
  Future<StoryModel?> getStory(String id) async {
    return storyStubs.firstWhereOrNull((element) => element.id == id);
  }
}

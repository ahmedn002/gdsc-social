import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/story_entity.dart';

part 'stories_view_state.dart';

class StoriesViewCubit extends Cubit<StoriesViewState> {
  late Map<String, int> _storiesIndices;
  StoriesViewCubit() : super(StoriesViewInitial());

  void initializeStories(List<StoryEntity> stories, StoryEntity initialStory) {
    _storiesIndices = {
      for (var story in stories) story.storyId: 0,
    };
    emit(StoriesViewIndexChange(initialStory.storyId, 0));
  }

  void updateStoryIndex(String storyId, int index) {
    _storiesIndices[storyId] = index;
    emit(StoriesViewIndexChange(storyId, index));
  }

  int getStoryIndex(String storyId) {
    return _storiesIndices[storyId] ?? 0;
  }
}

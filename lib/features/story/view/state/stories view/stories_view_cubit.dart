import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/story_entity.dart';

part 'stories_view_state.dart';

class StoriesViewCubit extends Cubit<StoriesViewState> {
  late Map<String, int> _storiesIndices;
  StoriesViewCubit() : super(StoriesViewInitial());

  void initializeStories(List<StoryEntity> stories) {
    _storiesIndices = {
      for (var story in stories) story.storyId: 0,
    };
  }

  void updateStoryIndex(String storyId, int index) {
    _storiesIndices[storyId] = index;
    emit(StoriesViewIndexChange(storyId, index));
  }

  int getStoryIndex(String storyId) {
    return _storiesIndices[storyId] ?? 0;
  }
}

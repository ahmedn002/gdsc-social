import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/story_entity.dart';
import '../../../domain/use cases/get_stories_use_case.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final GetStoryUseCase _getStoryUseCase;

  StoryCubit(this._getStoryUseCase) : super(StoryInitial());

  Future<void> getStory(String storyId) async {
    emit(StoryLoading());
    final result = await _getStoryUseCase(storyId);
    result.fold(
      (failure) => emit(StoryFailure(failure.message)),
      (story) {
        if (story == null) {
          emit(StoryNotFound());
        } else {
          emit(StorySuccess(story));
        }
      },
    );
  }
}

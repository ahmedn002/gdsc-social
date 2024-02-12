import 'package:bloc/bloc.dart';
import 'package:gdsc_social/features/home/domain/entities/story_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/use cases/get_stories_use_case.dart';

part 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  final GetStoriesUseCase getStoriesUseCase;

  StoriesCubit(this.getStoriesUseCase) : super(StoriesInitial()) {
    _getStories();
  }

  Future<void> _getStories() async {
    emit(StoriesLoading());
    final result = await getStoriesUseCase();
    result.fold(
      (failure) => emit(StoriesFailure(failure.message)),
      (stories) => emit(StoriesSuccess(stories)),
    );
  }
}

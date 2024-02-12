part of 'stories_cubit.dart';

@immutable
abstract class StoriesState {}

class StoriesInitial extends StoriesState {}

class StoriesLoading extends StoriesState {}

class StoriesFailure extends StoriesState {
  final String message;

  StoriesFailure(this.message);
}

class StoriesSuccess extends StoriesState {
  final List<StoryEntity> stories;

  StoriesSuccess(this.stories);
}

part of 'story_cubit.dart';

@immutable
abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryNotFound extends StoryState {}

class StoryFailure extends StoryState {
  final String message;

  StoryFailure(this.message);
}

class StorySuccess extends StoryState {
  final StoryEntity story;

  StorySuccess(this.story);
}

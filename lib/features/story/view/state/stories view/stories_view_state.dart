part of 'stories_view_cubit.dart';

abstract class StoriesViewState {}

class StoriesViewInitial extends StoriesViewState {}

class StoriesViewIndexChange extends StoriesViewState {
  final String storyId;
  final int index;

  StoriesViewIndexChange(this.storyId, this.index);
}

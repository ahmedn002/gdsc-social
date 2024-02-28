part of 'hashtags_cubit.dart';

abstract class HashtagsState {}

class HashtagsInitial extends HashtagsState {}

class HashtagsLoading extends HashtagsState {}

class HashtagsFailure extends HashtagsState {
  final String message;

  HashtagsFailure(this.message);
}

class HashtagsSuccess extends HashtagsState {
  final List<HashTagEntity> hashtags;

  HashtagsSuccess(this.hashtags);
}

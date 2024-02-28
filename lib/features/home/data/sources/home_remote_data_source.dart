import 'package:gdsc_social/features/home/data/stubs/hashtag_stubs.dart';
import 'package:gdsc_social/features/home/data/stubs/post_stubs.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';

import '../../../story/data/stubs/story_stubs.dart';
import '../../../story/domain/entities/story_entity.dart';
import '../../domain/entities/hashtag_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<StoryEntity>> getStories();
  Future<List<PostEntity>> getPosts();
  Future<List<HashTagEntity>> getPopularHashtags();
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  @override
  Future<List<StoryEntity>> getStories() {
    return Future.value(storyStubs);
  }

  @override
  Future<List<PostEntity>> getPosts() {
    return Future.value(postStubs);
  }

  @override
  Future<List<HashTagEntity>> getPopularHashtags() {
    return Future.value(hashtagStubs);
  }
}

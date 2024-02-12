import 'package:gdsc_social/features/home/data/stubs/post_stubs.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';

import '../../domain/entities/story_entity.dart';
import '../stubs/story_stubs.dart';

abstract class HomeRemoteDataSource {
  Future<List<StoryEntity>> getStories();
  Future<List<PostEntity>> getPosts();
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
}

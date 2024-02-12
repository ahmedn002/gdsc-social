import 'package:dartz/dartz.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/domain/entities/story_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories();
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
